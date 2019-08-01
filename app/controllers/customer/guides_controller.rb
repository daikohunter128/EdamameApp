class Customer::GuidesController < Customer::Base
  def introduction
    render action: 'introduction'
  end
  
  def information
    render action: 'information'
  end
end
