class Customer::HistoryForm
  include ActiveModel::Model
  
  attr_accessor :history
  delegate :persisted?, :save, to: :history
  
  def initialize(history = nil)
    @history = history
    @history ||= History.new
  end
  
  def assign_attributes(params = {})
    @params = params
    history.assign_attributes(history_params)
  end
  
  private
  def history_params
    @params.require(:history).permit(:reservation, :undispatched, :nick_name)
  end
end