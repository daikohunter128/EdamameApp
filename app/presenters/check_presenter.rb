class CheckPresenter < ModelPresenter
  delegate :check_year, :check_month, :check_day, to: :object
  
  def check_year
    object.check_year
  end
  
  def check_month
    object.check_month
  end
  
  def check_day
    object.check_day
  end
end