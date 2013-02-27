class PersonSurveysController < ApplicationController
  before_filter :get_user

  def show
    @person_survey = @current_user.people.primary.person_survey
  end

  def new
    @person_survey = PersonSurvey.new
  end

  def create
    @person = @current_user.people.primary
    local_params = params
    local_params[:person_survey][:person_id] = @person.id
#    @person.person_survey=PersonSurvey.new(params[:person_survey])
#    @person_survey = @person.person_survey
    @person_survey=PersonSurvey.new(local_params[:person_survey])

    if @person_survey.save
      flash.now[:success] = "Thank you!"
      redirect_to @current_user
    else
      render 'new'
    end
  end

  protected    
    def get_user
      @current_user = current_user
    end
end
