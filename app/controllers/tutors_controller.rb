class TutorsController < ApplicationController
  before_action :load_tutor, only: %i(show)

  def index
    @tutors = Tutor.newest
  end

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new tutor_params
    if @tutor.save
      flash[:success] = "Bạn đã đăng ký thành công"
      redirect_to @tutor
    else
      render :new
    end
  end

  def show; end

  private

  def tutor_params
    params.require(:tutor).permit :gender, :dob, :phone, :address,
      :literacy, :avatar, :introduce, :user_id
  end

  def load_tutor
    @tutor = Tutor.find_by id: params[:id]
    return if @tutor
    redirect_to current_user
  end
end
