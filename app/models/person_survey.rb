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

class PersonSurvey < ActiveRecord::Base
  belongs_to :person
  attr_accessible :art_interest, :birthday, :decisionmaking_score, :film_interest, :fitness_interest, :food_interest, :game_interest, :gender, :infoprocessing_score, :language, :music_interest, :outdoor_interest, :people_score, :politics_interest, :profession, :relationship_status, :siteseeing_interest, :stem_interest, :structure_score, :person_id
  validates :birthday, presence: true
end
