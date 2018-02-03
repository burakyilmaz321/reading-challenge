class ReadingsController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @readings = current_user.readings.includes(:book)
      @other_users = User.includes(:readings).where.not id: current_user
      @months = %w(January February March April May June
                 July August September October November December)
    end
  end

  def create
    if user_signed_in?
      @reading = current_user.readings.new(reading_params)
      if @reading.save
        redirect_to root_path
      end
    end
  end
  
  def update
    if user_signed_in?
      @reading = current_user.readings.find(params[:id])
      if @reading.update(reading_params)
        redirect_to root_path
      end
    end
  end

  def destroy
    if user_signed_in?
      @reading = current_user.readings.find(params[:id])
      @reading.destroy
      redirect_to root_path    
    end
  end

  private

  def reading_params
    params.require(:reading).permit(:status, :month, book_attributes: [:id, :title, :page_num, author_attributes: [:id, :name]])
  end
end
