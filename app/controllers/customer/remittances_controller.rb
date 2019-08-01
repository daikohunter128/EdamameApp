class Customer::RemittancesController < Customer::Base
  before_action :authorize
  
  def deposit
    time = Time.zone.now
    customer = Customer.find_by(id: current_customer.id)
    address = Address.find_by(customer_id: current_customer.id)
    deposit = Remittance.new(deposit_params)
    deposit.full_name = customer.family_name + customer.given_name
    deposit.nick_name = customer.nick_name
    deposit.customer_id = customer.id
    deposit.deposit = "入金済み"
    deposit.deposit_time = Date.today
    deposit.deposit_year = time.year
    deposit.deposit_month = time.month
    deposit.prefecture = address.prefecture + address.city
    if deposit.save
      flash.notice = '入金完了の連絡をしました。'  
      redirect_to :customer_root
    else
      flash.now.alert = '入力に誤りがあります。'
      redirect_to :customer_root
    end
  end
  
  private
  def deposit_params
    params.permit(rwmittance: [:deposit, :deposit_year, :deposit_month, :deposit_time, :full_name, :nick_name, :customer_id])
  end
end
