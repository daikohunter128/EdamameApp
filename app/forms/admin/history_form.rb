class Admin::HistoryForm
  include ActiveModel::Model
  
  attr_accessor :history
  delegate :persisted?, :save, to: :history
  
  def initialize(history = nil)
    @history = history
    @history ||= History.new(customer_id: 1)
  end
  
  def assign_attributes(params = {})
    @params = params
    history.assign_attributes(history_params)
  end
  
  private
  def history_params
    @params.require(:history).permit(:reservation, :undispatched)
  end
end