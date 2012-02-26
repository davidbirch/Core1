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

class Order < ActiveRecord::Base
  
  # associations
  has_many :transactions, :class_name => "OrderTransaction"
  
  # model updates
  attr_accessor :card_number, :card_verification
  
  # validations
  validates :total_amount, :first_name, :last_name, :card_expires_on, presence: true
  validate :validate_card, :on => :create
  
  # this method executes a purchase with the eWay gateway using ActiveMerchant
  def purchase
    
    #calculate the remaining options
    @options = {
      :order_id => '123',
      :billing_address => {
        :address1 => '',
        :city => '',
        :state => '',
        :country => '',
        :zip => ''
        },
    }
    
    # process the payment
    response = GATEWAY.purchase(price_in_cents, credit_card, @options)
    
    #record the transaction
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response )
        
    # return the response from the payment
    response.success?
  end
  
  def price_in_cents
    ((total_amount.to_f)*100).round
  end
  
  
  
  
  private
  
    # this method creates an ActiveMerchant creditcard object
    def credit_card
      @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :number => card_number,
        :verification_value => card_verification,
        :month => card_expires_on.month,
        :year => card_expires_on.year,
        :first_name => first_name,
        :last_name => last_name
      )
    end
    
    
    #this method validates the credit card
    def validate_card
      unless credit_card.valid?
        credit_card.errors.full_messages.each do |message|
          errors[:base] << message
          #errors.add_to_base message
        end
      end
    end
  
end
