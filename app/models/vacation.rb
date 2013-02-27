# == Schema Information
#
# Table name: vacations
#
#  id         :integer          not null, primary key
#  date_start :date
#  date_end   :date
#  location   :string(255)
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vacation < ActiveRecord::Base
  belongs_to :user
  has_many :trips, through: :trip_codes
  has_many :trip_codes
  attr_accessible :date_end, :date_start, :location, :name
end
