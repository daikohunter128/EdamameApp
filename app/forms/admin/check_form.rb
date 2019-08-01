class Admin::CheckForm
  include ActiveModel::Model
  
  attr_accessor :check
  delegate :persisted?, :save, to: :check
  
  def initialize(check = nil)
    @check = check
    @check ||= Check.new
  end
  
  def assign_attributes(params = {})
    @params = params
    check.assign_attributes(check_params)
  end
  
  private
  def check_params
    @params.require(:check).permit(:check_year, :check_month, :check_day)
  end
end