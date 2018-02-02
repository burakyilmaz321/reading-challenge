class ReadingsController < ApplicationController
  def index
    if user_signed_in?
      @readings = current_user.readings
      @other_users = User.where.not id: current_user
    end
  end

  def new
    @reading = current_user.readings.new
    @months = %w(January February March April May June
                 July August September October November December)
  end

  def create
    @reading = current_user.readings.new(reading_params)
    if @reading.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @reading = current_user.readings.find(params[:id])
    @months = %w(January February March April May June
                 July August September October November December)
  end
  
  def update
    @reading = current_user.readings.find(params[:id])
    if @reading.update(reading_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @reading = current_user.readings.find(params[:id])
    @reading.destroy
    redirect_to root_path    
  end

  private

  def reading_params
    params.require(:reading).permit(:status, :month, book_attributes: [:title, :page_num, author_attributes: [:name]])
  end
end
