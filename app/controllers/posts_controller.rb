class PostsController < ApplicationController
  before_action :load_post, only: %i(show edit update destroy register approve reject finish)

  def index
    @posts = Post.newest.open
  end

  def new
    if current_user.tutor?
      @post = current_user.tutor.posts.build
    else
      @post = current_user.student.posts.build
    end
  end

  def create
    if current_user.tutor?
      @post = current_user.tutor.posts.build post_params
    else
      @post = current_user.student.posts.build post_params
    end
    if @post.save
      flash[:success] = "Cập nhật thành công"
      redirect_to @post
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update_attributes post_params
      flash[:success] = "Cập nhật thành công"
      if @post.starting?
        redirect_to showclass_report_path(@post)
      else
        redirect_to @post
      end
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to current_user
  end

  def register
    if @post.ofTutor?
      if current_user.tutor? || current_user.admin?
        redirect_to current_user
      else
        @post.update_attributes status: 1, student_id: current_user.student.id
        redirect_to current_user
      end
    else
      if current_user.student? || current_user.admin?
        redirect_to current_user
      else
        @post.update_attributes status: 1, tutor_id: current_user.tutor.id
        redirect_to current_user
      end
    end
  end

  def approve
    @post.update_attributes status: 2
    flash[:success] = "Bạn đã phê duyệt yêu cầu"
    redirect_to current_user
  end

  def reject
    if @post.ofTutor?
      @post.update_attributes status: 0, student_id: nil
    else
      @post.update_attributes status: 0, tutor_id: nil
    end
    flash[:success] = "Bạn đã từ chối yêu cầu"
    redirect_to current_user
  end

  def finish
    @post.update_attributes status: 3, to_date: Date.current
    flash[:success] = "Bạn đã kết thúc lớp học"
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit :subject_id, :level, :title, :fee, :from_date, :brand
  end

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
    redirect_to current_user
  end
end
