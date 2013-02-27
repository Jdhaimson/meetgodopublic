class TripSurveysController < ApplicationController
  def new
    @trip_survey = TripSurvey.new
  end

  def create
    ts = TripSurvey.new(params[:trip_survey])
    @current_user = current_user
    @person = @current_user.people.primary
    ts.person_id = @person.id
    @trip = Trip.find(session[:trip_id])
    ts.trip_id = @trip.id
    ts.save
    redirect_to matches_path
  end

  def show
    @trip_survey = Trip.find(params[:id])
  end

end
