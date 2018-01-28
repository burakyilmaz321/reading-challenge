class ReadingsController < ApplicationController
  def index
    if user_signed_in?
      @readings = current_user.readings
    end
  end

  def new
    @reading = current_user.readings.new
  end

  def create
    @reading = current_user.readings.new(reading_params)
    if @reading.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def reading_params
    params.require(:reading).permit(:status, :month, book_attributes: [:title, :page_num, author_attributes: [:name]])
  end
end
