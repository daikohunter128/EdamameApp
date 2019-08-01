class Admin::HistoriesController < Admin::Base
  @@cust = Customer.maximum("id")
  
  def new
    @history_form = Admin::HistoryForm.new
  end
  
  def create
    @history_form = Admin::HistoryForm.new
    @history_form.assign_attributes(params[:form])
    if @history_form.save
      @change_id = @history_form.history
      @change_id.customer_id = @@cust
      @change_id.save
      flash.notice = '注文を受け付けました。'
      redirect_to action: :roger
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new'
    end
  end
  
  def show
    @customer = Customer.find_by(id: params[:id])
    @history = History.where(customer_id: params[:id])
  end
 
  def edit
    history = History.find(params[:id])
    @reservation = history.reservation
    @year = history.created_at.year
    @month = history.created_at.month
    @day = history.created_at.day
    @customer = Customer.find_by(id: history.customer_id)
    @history_form = Admin::HistoryForm.new(History.find(params[:id]))
  end
  
  def update
    @history_form = Admin::HistoryForm.new(History.find(params[:id]))
    @history_form.assign_attributes(params[:form])
    
    if @history_form.save
      flash.notice = '発送完了しました。'
      redirect_to :admin_undispatched_admin_history
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  def destroy
    history = History.find(params[:id])
    history.destroy!
    flash.notice = '注文をキャンセルしました。'
    redirect_to :admin_undispatched_admin_history
  end
  
  def reservation
    @time = Date.today
    @reservation = History.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
  
  def undispatched
    @undispatched = History.where(undispatched: "未発送")
  end
  
  def purchase
    check = Check.find(1)
    year = check.check_year
    month = check.check_month
    day = check.check_day
    a = "-"
    @abc = year.to_s + a + month.to_s + a + day.to_s
    @history = History.where(created_at: @abc.in_time_zone.all_day)
  end
  
  def roger
    customer = Customer.find(@@cust)
    f_name = customer.family_name
    g_name = customer.given_name
    @full_name = f_name + ' ' + g_name
    c = History.maximum("id")
    a = History.find_by(id: c)
    @a = a.reservation
    @b = @a.to_i * 1000
  end
  
  def chart
    time = Time.zone.now
    @customer = History.where(year: time.year).order("customer_id")
  end
  
  private
  def history_params
    params.require(:history).permit(:reservation, :undispatched)
  end
end
