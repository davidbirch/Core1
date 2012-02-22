# == Schema Information
#
# Table name: order_transactions
#
#  id             :integer(4)      not null, primary key
#  order_id       :integer(4)
#  action         :string(255)
#  amount         :integer(4)
#  trxn_status    :boolean(1)
#  trxn_number    :string(255)
#  trxn_reference :string(255)
#  trxn_option_1  :string(255)
#  trxn_option_2  :string(255)
#  trxn_option_3  :string(255)
#  auth_code      :string(255)
#  returnamount   :integer(4)
#  trxn_error     :string(255)
#  params         :text
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class OrderTransaction < ActiveRecord::Base
  
  # associations
  belongs_to :order
  
  # model updates
  serialize :params
  
  # this method creates the response based on the ActiveMerchant response
  def response=(response)
    self.trxn_status = response.success?
    self.auth_code = response.authorization
    self.trxn_error = response.message
    self.params = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.trxn_status = false
    self.auth_code = nil
    self.trxn_error = e.message
    self.params = {}
  end
  
end
