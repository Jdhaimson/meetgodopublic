# == Schema Information
#
# Table name: trip_surveys
#
#  id                     :integer          not null, primary key
#  goal                   :string(255)
#  relaxing_interest      :integer
#  sightseeing_interest   :integer
#  fitness_interest       :integer
#  food_interest          :integer
#  meetingpeople_interest :integer
#  adventuring_interest   :integer
#  games_interest         :integer
#  trip_id                :integer
#  person_id              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  top_interest1          :string(255)
#  top_interest2          :string(255)
#  top_interest3          :string(255)
#

require 'spec_helper'

describe TripSurvey do
  pending "add some examples to (or delete) #{__FILE__}"
end
