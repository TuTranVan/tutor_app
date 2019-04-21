class ReportsController < ApplicationController
  before_action :load_post, only: %i(showclass)
  before_action :load_report, only: %i(destroy)

  def showclass; end

  def create
    @report = Report.new report_params
    if @report.save
      flash[:success] = "Cập nhật thành công"
    else
      flash[:danger] = "Cập nhật thất bại"
    end
    redirect_to showclass_report_path(@report.post)
  end

  def destroy
    if @report.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to showclass_report_path(@report.post)
  end

  private

  def report_params
    params.require(:report).permit :post_id, :study_date, :content
  end

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
    redirect_to current_user
  end

  def load_report
    @report = Report.find_by id: params[:id]
    return if @report
    redirect_to current_user
  end
end
