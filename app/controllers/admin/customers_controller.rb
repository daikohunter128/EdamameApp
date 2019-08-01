class Admin::CustomersController < Admin::Base
  before_action :authorize
  
  def index
    #@search_form = Admin::CustomerSearchForm.new(params[:search])
    #@customers = @search_form.search.page(params[:page])
    @customers = Customer.all.order("id")
  end
  
  def show
    @customer = Customer.find(params[:id])
    @history = History.where(customer_id: params[:id])
  end
  
  def new
    @customer_form = Admin::CustomerForm.new
  end
  
  def edit
    @customer_form = Admin::CustomerForm.new(Customer.find(params[:id]))
  end
  
  def create
    @customer_form = Admin::CustomerForm.new
    @customer_form.assign_attributes(params[:form])
    if @customer_form.save
      flash.notice = '顧客アカウントを新規登録しました。'
      redirect_to :admin_root
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new'
    end
  end
  
  def update
    @customer_form = Admin::CustomerForm.new(Customer.find(params[:id]))
    @customer_form.assign_attributes(params[:form])
    if @customer_form.save
      flash.notice = '顧客情報を更新しました。'
      redirect_to action: 'index'
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  def destroy
    customer = Customer.find(params[:id])
    customer.destroy!
    flash.notice = '顧客アカウントを削除しました。'
    redirect_to :admin_customers
  end
  
  private
  def customer_params
    @params.require(:customer).permit(:email, :password, :family_name, :given_name, :family_name_kana, :given_name_kana, :nick_name)
  end
  
  def authorize
    unless current_administrator
      redirect_to :admin_login
    end
  end
end
