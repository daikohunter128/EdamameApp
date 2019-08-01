class Customer::HistoriesController < Customer::Base
  before_action :authorize
  def new
    @history_form = Customer::HistoryForm.new
    @stock = Administrator.find(1)
  end
  
  def create
    @history_form = Customer::HistoryForm.new
    @history_form.assign_attributes(params[:form])
    if @history_form.save
      @change_id = @history_form.history
      @change_id.customer_id = current_customer.id
      @change_id.nick_name = current_customer.nick_name
      @change_id.year = @change_id.created_at.year.to_i
      @change_id.month = @change_id.created_at.month.to_i
      @change_id.day = @change_id.created_at.day.to_i
      @change_id.save
      flash.notice = '購入ありがとうございます。注文を承りました。'
      redirect_to action: :roger
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new'
    end
  end
  
  def show
    @history = History.where(customer_id: params[:id])
  end
  
  def undispatched
    customer = Customer.find_by(id: current_customer.id)
    @full_name = customer.family_name + customer.given_name
    @nick_name = customer.nick_name
    @undispatched = History.where(customer_id: current_customer.id)
  end
  
  def roger
    c = History.maximum("id")
    a = History.find_by(id: c)
    @a = a.reservation
    @b = @a.to_i * 1000
  end
  
  private
  def authorize
    unless current_customer
      redirect_to :customer_login
    end
  end
end
