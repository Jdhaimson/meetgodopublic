class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @current_user = current_user
    @person = @current_user.people.primary

    t = TripCode.find_by_code( params[:trip][:trip_code][:code] )
 
    if !t.nil?
      @trip = @person.trips.create
      t.update_attributes( trip_id: @trip.id )
      session[:trip_id] = @trip.id
      redirect_to tripsurvey_path
    else
      flash[:error] = "Please enter a valid trip code"
      @trip = Trip.new
      render 'new'
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @vacation = @trip.vacation
  end

end
