class TripCodesController < ApplicationController
  def create
    vacation_id = params[:trip_code][:vacation_id]
    code = SecureRandom.hex(10)
    if TripCode.create(vacation_id: vacation_id, code: code) 
      flash[:success] = "Your trip code is: " + code
    else
      flash[:error] = "There was an error generating your code.  Please try again."
    end
    @vacation = Vacation.find(vacation_id)
    redirect_to @vacation
  end
end
