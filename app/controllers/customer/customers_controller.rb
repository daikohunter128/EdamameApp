
class Customer::CustomersController < Customer::Base
  before_action :authorize
  
  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer_form = Customer::CustomerForm.new
  end

  def edit
    @customer_form = Customer::CustomerForm.new(current_customer)
  end
  
  def create
    @customer_form = Customer::Customer_form.new
    @customer_form.assign_attributes(params[:form])
    if @customer_form.save
      flash.notice = 'お客様のアカウントを新規登録しました。'
      redirect_to action: 'index'
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new'
    end
  end
  
  def update
    @customer_form = Customer::CustomerForm.new(current_customer)
    @customer_form.assign_attributes(params[:form])
    if @customer_form.save
      flash.notice = 'アカウント情報を更新しました。'
      redirect_to :customer_root
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  def destroy
    customer = Customer.find(params[:id])
    customer.destroy!
    flash.notice = '顧客アカウントを削除しました。'
  end
 
  private
  def customer_params
    params.permit(customer: [:email, :password, :family_name, :given_name, :family_name_kana, :given_name_kana, :start_date, :end_date])
  end
  
  def authorize
    unless current_customer
      redirect_to :customer_login
    end
  end
end

