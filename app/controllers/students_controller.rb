class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new student_params
    if @student.save
      flash[:success] = "Bạn đã đăng ký thành công"
      redirect_to @student.user
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit :gender, :dob, :phone, :address,
      :literacy, :user_id
  end
end
