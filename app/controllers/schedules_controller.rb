class SchedulesController < ApplicationController
  before_action :load_schedule, only: %i(destroy)

  def create
    @schedule = Schedule.new schedule_params
    if @schedule.save
      flash[:success] = "Cập nhật thành công"
    else
      flash[:danger] = "Cập nhật thất bại"
    end
    redirect_to @schedule.post
  end

  def destroy
    if @schedule.destroy
      flash[:success] = "Bạn đã xóa thành công"
    else
      flash[:danger] = "Có lỗi khi xóa. Vui lòng thử lại"
    end
    redirect_to @schedule.post
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
