class Customer::TopController < Customer::Base
  skip_before_action :authorize
  
  def index
    if current_customer
      @customer = current_customer
      render action: 'dashboard'
    else
      render action: 'open'
    end
  end
  
  def open
    render action: 'open'
  end
end
