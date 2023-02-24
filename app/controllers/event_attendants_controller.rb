class EventAttendantsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event_attendant = EventAttendant.new(grab_event)
    @event_attendant.user_id = current_user.id
    unless EventAttendant.where(user_id: current_user.id)
      .where(event_id: @event_attendant.event).exists?
      if @event_attendant.save
        flash.now[:sucess] = 'Success at joining event'
        redirect_to root_path
      else
        flash[:error] = 'Error at joning event'
        redirect_to root_path
      end
    else
      flash[:error] = 'You already joined the event'
      redirect_to root_path
    end
  end

  private
    def grab_event
      params.require(:event).permit(:event_id)
    end

    def check_user
      user_signed_in?
    end
end