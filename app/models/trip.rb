# == Schema Information
#
# Table name: trips
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  trip_identifier :string(255)
#

class Trip < ActiveRecord::Base
  attr_accessible :trip_identifier

  before_create { |trip| trip.trip_identifier = SecureRandom.hex(10) }

  has_and_belongs_to_many :people 
  has_one :vacation, through: :trip_code
  has_one :trip_code
  has_many :trip_surveys, dependent: :destroy
end
