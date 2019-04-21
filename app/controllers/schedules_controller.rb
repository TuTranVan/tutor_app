class SchedulesController < ApplicationController
  before_action :load_schedule, only: %i(destroy)

  def create
    @schedule = Schedule.new schedule_params
    if @schedule.save
      flash[:success] = "Cập nhật thành công"
    else
      flash[:danger] = "Cập nhật thất bại"
    end

    if @schedule.post.starting?
      redirect_to showclass_report_path(@schedule.post)
    else
      redirect_to @schedule.post
    end
  end

  def destroy
    if @schedule.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end

    if @schedule.post.starting?
      redirect_to showclass_report_path(@schedule.post)
    else
      redirect_to @schedule.post
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit :post_id, :day, :start_time, :end_time
  end

  def load_schedule
    @schedule = Schedule.find_by id: params[:id]
    return if @schedule
    redirect_to current_user
  end
end
