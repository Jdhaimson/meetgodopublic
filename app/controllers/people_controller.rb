class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params[:person])
    @person.is_primary = false
    @person.save
  end

end
