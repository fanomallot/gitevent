class ParticipationsController < ApplicationController
def index
@event = Event.find(params[:event_id])
end
def new
end
def create

end


end
