class Admin::ChecksController < Admin::Base
  def show
    @check = current_administrator
    @check = Check.find_by(customer_id: current_administrator.id)
  end
  
  def edit
    abc = Check.ids
    if abc.empty?
      check = Check.new
      check.save
    end
    @check_form = Admin::CheckForm.new(Check.find(1))
  end
  
  def update
    @check_form = Admin::CheckForm.new(Check.find(1))
    @check_form.assign_attributes(params[:form])
    if @check_form.save
      flash.notice = '検索した注文履歴です。'
      redirect_to :admin_purchase_admin_history
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
