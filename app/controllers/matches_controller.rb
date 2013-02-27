class MatchesController < ApplicationController
  def show
    @match = Match.new
    if params[:trip_id].nil?
      @trip = Trip.find(session[:trip_id])
    else
      @trip = Trip.find(params[:trip_id])
    end
    @people = @trip.people
    if(!params[:group].nil?)
      group = params[:group].split(',')
      @matches = @match.find_matches(session[:trip_id], group)
#     @matches = Match.find_matches(params[:group])
    end
  end
end
