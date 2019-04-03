class Admin::SubjectsController < AdminController
  before_action :load_subject, only: %i(edit update destroy)

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Bạn đã thêm mới một môn học"
      redirect_to admin_subjects_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = "Bạn đã cập nhật thành công"
      redirect_to admin_subjects_path
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to admin_subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit :name
  end

  def load_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject
    redirect_to admin_subjects_path
  end
end
