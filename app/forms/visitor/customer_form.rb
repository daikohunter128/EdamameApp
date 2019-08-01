class Visitor::CustomerForm
  include ActiveModel::Model

  attr_accessor :customer, :inputs_address
  delegate :persisted?, :save, to: :customer
  
  def initialize(customer = nil)
    @customer = customer
    @customer ||= Customer.new
    
    (2 - @customer.personal_phones.size).times do
      @customer.personal_phones.build
    end
    
    self.inputs_address = @customer.address.blank?
    @customer.build_address unless @customer.address
    #@customer.build_history unless @customer.history_ids
  end
  
  def assign_attributes(params = {})
    @params = params
    self.inputs_address = params[:inputs_address] == '1'

    customer.assign_attributes(customer_params)
    
    phones = phone_params(:customer).fetch(:phones)
    customer.personal_phones.size.times do |index|
      attributes = phones[index.to_s]
      if attributes && attributes[:number].present?
        customer.personal_phones[index].assign_attributes(attributes)
      else
        customer.personal_phones[index].mark_for_destruction
      end
    end
    
    if inputs_address
      customer.address.assign_attributes(address_params)
    else
      customer.address.mark_for_destruction
    end
  end

  private
  def customer_params
    @params.require(:customer).permit(
      :email, :password,
      :family_name, :given_name, :family_name_kana, :given_name_kana, :nick_name
    )
  end

  def address_params
    @params.require(:address).permit(
      :postal_code, :prefecture, :city, :address1, :address2
    )
  end
  
  def phone_params(record_name)
    @params.require(record_name).permit(phones: [ :number, :primary ])
  end
end
