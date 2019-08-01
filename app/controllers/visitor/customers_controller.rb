class Visitor::CustomersController < Visitor::Base
  def new
    @customer_form = Visitor::CustomerForm.new
    @stock = Administrator.find(1)
  end
  
  def create
    @customer_form = Visitor::CustomerForm.new
    @customer_form.assign_attributes(params[:form])
    if @customer_form.save
      flash.notice = 'お客様アカウントを新規登録しました。会員ページにログインし注文してください。'
      #redirect_to :new_visitor_history
      redirect_to :customer_root
      #$nick_name = @customer_form.nick_name
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new'
    end
  end
  
  def money
    customer = Customer.find_by(id: current_customer.id)
    customer.money = "入金完了"
    customer.money_time = Date.today
    customer.save
  end
  
  private
  def customer_params
    @params.require(:customer).permit(:email, :password, :family_name, :given_name, :family_name_kana, :given_name_kana, :money, :money_time)
  end
end