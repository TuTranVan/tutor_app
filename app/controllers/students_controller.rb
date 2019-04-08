class StudentsController < ApplicationController
  before_action :load_student, only: %i(show)

  def new
    @student = Student.new
  end

  def create
    @student = Student.new student_params
    if @student.save
      flash[:success] = "Bạn đã đăng ký thành công"
      redirect_to @student
    else
      render :new
    end
  end

  def show; end

  private

  def student_params
    params.require(:student).permit :gender, :dob, :phone, :address,
      :literacy, :user_id
  end

  def load_student
    @student = Student.find_by id: params[:id]
    return if @student
    redirect_to current_user
  end
end
