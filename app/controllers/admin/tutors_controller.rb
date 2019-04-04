class Admin::TutorsController < AdminController
  before_action :load_tutor, only: %i(show)

  def index
    @tutors = Tutor.all
  end

  def show; end

  private

  def load_tutor
    @tutor = Tutor.find_by id: params[:id]
    return if @tutor
    redirect_to admin_tutors_path
  end
end
