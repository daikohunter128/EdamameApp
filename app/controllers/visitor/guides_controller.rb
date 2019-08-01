class Visitor::GuidesController < Visitor::Base
  def introduction
    render action: 'introduction'
  end
  
  def information
    render action: 'information'
  end
  
  def bank
    render action: 'bank'
  end
end
