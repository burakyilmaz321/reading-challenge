class ReadingsController < ApplicationController
  def index
    if user_signed_in?
      @readings = current_user.readings
    end
  end

  def new
    @reading = current_user.readings.new
  end
end
