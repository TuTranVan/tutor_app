class MajorsController < ApplicationController
  before_action :load_major, only: %i(destroy)

  def create
    @major = current_user.tutor.majors.build major_params
    if @major.save
      flash[:success] = "Cập nhật thành công"
    else
      flash[:danger] = "Cập nhật thất bại"
    end
    redirect_to current_user.tutor
  end

  def destroy
    if @major.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to current_user.tutor
  end

  private

  def major_params
    params.require(:major).permit :subject_id
  end

  def load_major
    @major = Major.find_by id: params[:id]
    return if @major
    redirect_to current_user.tutor
  end
end
