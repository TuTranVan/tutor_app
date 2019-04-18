class PostsController < ApplicationController
  before_action :load_post, only: %i(show edit update destroy)

  def index

  end

  def new
    @tutor = current_user.tutor
    @post = @tutor.posts.build
  end

  def create
    @post = current_user.tutor.posts.build post_params
    if @post.save
      flash[:success] = "Cập nhật thành công"
      redirect_to @post.tutor
    else
      @tutor = current_user.tutor
      render :new
    end
  end

  def show

  end

  def edit
    @tutor = current_user.tutor
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = "Cập nhật thành công"
      redirect_to current_user.tutor
    else
      @tutor = current_user.tutor
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to current_user.tutor
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
