class Admin::StudentsController < AdminController
  before_action :load_student, only: %i(show)

  def index
    @students = Student.newest
  end

  def show; end

  private

  def load_student
    @student = Student.find_by id: params[:id]
    return if @student
    redirect_to admin_students_path
  end
end
