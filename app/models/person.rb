# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  is_primary :boolean
#

class Person < ActiveRecord::Base
  attr_accessible :name, :is_primary, :user_id
  validates :name, presence: true, length: { maximum: 50 }

  belongs_to :user
  has_one :person_survey, dependent: :destroy
  has_and_belongs_to_many :trips
=begin                           do
    def creator
      where( creator_id: self.id ).first
    end
  end
=end

  has_many :trip_surveys, dependent: :destroy

end
