# == Schema Information
#
# Table name: order_transactions
#
#  id                     :integer(4)      not null, primary key
#  order_id               :integer(4)
#  action                 :string(255)
#  amount                 :integer(4)
#  response_success       :string(255)
#  response_authorization :string(255)
#  response_message       :string(255)
#  trxn_status            :boolean(1)
#  trxn_number            :string(255)
#  trxn_reference         :string(255)
#  trxn_option_1          :string(255)
#  trxn_option_2          :string(255)
#  trxn_option_3          :string(255)
#  auth_code              :string(255)
#  return_amount          :integer(4)
#  trxn_error             :string(255)
#  params                 :text
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

class OrderTransaction < ActiveRecord::Base
  
  # associations
  belongs_to :order
  
  # model updates
  serialize :params
  
  # this method creates the response based on the ActiveMerchant response
  def response=(response)
    self.response_success = response.success?
    self.response_authorization = response.authorization
    self.response_message = response.message
    
    #self.id
    #self.order_id
    #self.amount
    #self.action
        
    self.trxn_status = response.params["ewaytrxnstatus"]
    self.trxn_number = response.params["ewaytrxnnumber"]
    self.trxn_reference = response.params["ewaytrxnreference"]
    self.trxn_option_1 = response.params["ewaytrxnoption1"]
    self.trxn_option_2 = response.params["ewaytrxnoption2"]
    self.trxn_option_3 = response.params["ewaytrxnoption3"]
    self.auth_code = response.params["ewayauthcode"]
    self.return_amount = response.params["ewayreturnamount"]
    self.trxn_error = response.params["ewaytrxnerror"]
   
    self.params = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.trxn_status = false
    self.auth_code = nil 
    self.trxn_error = e.message
  
    self.params = {}
  end
  
  


  
  
  
  
  
end
