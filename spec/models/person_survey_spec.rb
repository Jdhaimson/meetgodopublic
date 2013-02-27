# == Schema Information
#
# Table name: person_surveys
#
#  id                   :integer          not null, primary key
#  birthday             :date
#  gender               :string(255)
#  relationship_status  :string(255)
#  language             :string(255)
#  profession           :string(255)
#  outdoor_interest     :integer
#  fitness_interest     :integer
#  food_interest        :integer
#  art_interest         :integer
#  music_interest       :integer
#  siteseeing_interest  :integer
#  film_interest        :integer
#  game_interest        :integer
#  stem_interest        :integer
#  politics_interest    :integer
#  people_score         :integer
#  infoprocessing_score :integer
#  decisionmaking_score :integer
#  structure_score      :integer
#  person_id            :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'spec_helper'

describe PersonSurvey do
  pending "add some examples to (or delete) #{__FILE__}"
end
