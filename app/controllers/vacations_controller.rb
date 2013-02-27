class VacationsController < ApplicationController
  def show
    @vacation = Vacation.find(params[:id])
    @trip_code = TripCode.new
  end

  def new
    @vacation = Vacation.new
  end

  def create
    @current_user = current_user
    @vacation = @current_user.vacations.new(params[:vacation])

    if @vacation.save
      flash.now[:success] = "Vacation created!"
      redirect_to @vacation
    else
      render 'new'
    end
  end

end
