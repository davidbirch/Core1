# == Schema Information
#
# Table name: orders
#
#  id              :integer(4)      not null, primary key
#  total_amount    :decimal(8, 2)
#  first_name      :string(255)
#  last_name       :string(255)
#  card_expires_on :date
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
