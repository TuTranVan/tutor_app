class PostsController < ApplicationController
  before_action :load_post, only: %i(show edit update destroy)

  def index
    @posts = Post.all.open
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
      redirect_to @post
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

  private

  def post_params
    params.require(:post).permit :subject_id, :level, :title, :fee, :from_date, :brand
  end

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
    redirect_to current_user.tutor
  end
end