class ReadingsController < ApplicationController
  def index
    if user_signed_in?
      @readings = current_user.readings
    end
  end
end
