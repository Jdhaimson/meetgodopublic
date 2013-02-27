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

require 'spec_helper'

describe TripCode do
  pending "add some examples to (or delete) #{__FILE__}"
end
