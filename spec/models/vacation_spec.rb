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

require 'spec_helper'

describe Vacation do
  pending "add some examples to (or delete) #{__FILE__}"
end
