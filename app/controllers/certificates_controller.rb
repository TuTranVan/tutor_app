class CertificatesController < ApplicationController
  before_action :load_certificate, only: %i(edit update destroy)
  def new
    @tutor = current_user.tutor
    @certificate = @tutor.certificates.build
  end

  def create
    @certificate = current_user.tutor.certificates.build certificate_params
    if @certificate.save
      flash[:success] = "Cập nhật thành công"
      redirect_to @certificate.tutor
    else
      @tutor = current_user.tutor
      render :new
    end
  end

  def edit
    @tutor = current_user.tutor
  end

  def update
    if @certificate.update_attributes certificate_params
      flash[:success] = "Cập nhật thành công"
      redirect_to current_user.tutor
    else
      @tutor = current_user.tutor
      render :edit
    end
  end

  def destroy
    if @certificate.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to current_user.tutor
  end

  private

  def certificate_params
    params.require(:certificate).permit :school, :major, :grade, :course
  end

  def load_certificate
    @certificate = Certificate.find_by id: params[:id]
    return if @certificate
    redirect_to current_user.tutor
  end
end
