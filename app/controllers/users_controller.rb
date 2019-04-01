class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Bạn đã đăng ký thành công"
      log_in @user
      if @user.tutor?
        redirect_to new_tutor_path
      else
        redirect_to new_student_path
      end
    else
      render :new
    end
  end

  def destroy
    current_user.destroy
    log_out
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit :email, :password, :password_confirmation, :role
  end
end
