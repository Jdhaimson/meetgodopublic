require 'spec_helper'

describe MatchesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show--no-test-framework'" do
    it "returns http success" do
      get 'show--no-test-framework'
      response.should be_success
    end
  end

end
