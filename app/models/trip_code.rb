# == Schema Information
#
# Table name: trip_codes
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  vacation_id :integer
#  trip_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TripCode < ActiveRecord::Base
  attr_accessible :code, :vacation_id, :trip_id

  belongs_to :vacation
  belongs_to :trip
end
