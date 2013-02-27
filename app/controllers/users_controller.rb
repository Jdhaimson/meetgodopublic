class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @person = @user.people.primary
    @person_survey = @person.person_survey
    @trips = @person.trips
  end

  def new
    @user = User.new
  end

  def create
    local_params = params
    person_params = local_params[:user][:person]
    local_params[:user].delete("person")
    @user = User.new(local_params[:user])

    if @user.save
      @person = @user.people.new(person_params)
      @person.is_primary = true
      if @person.save
        sign_in @user
        flash.now[:success] = "Welcome to meet go do!"
        redirect_to personsurvey_path
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

end
