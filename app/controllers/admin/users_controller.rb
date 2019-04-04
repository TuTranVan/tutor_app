class Admin::UsersController < AdminController
  before_action :load_user, only: %i(edit update destroy)

  def index
    @users = User.admin
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.role = "admin"
    if @user.save
      @user.admin!
      flash[:success] = "Bạn đã thêm thành công"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Bạn đã cập nhật thành công"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    redirect_to admin_users_path
  end
end
