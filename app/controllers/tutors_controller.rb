class TutorsController < ApplicationController

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new tutor_params
    if @tutor.save
      flash[:success] = "Bạn đã đăng ký thành công"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tutor_params
    params.require(:tutor).permit :gender, :dob, :phone, :address,
      :literacy, :avatar, :introduce, :user_id
  end
end
