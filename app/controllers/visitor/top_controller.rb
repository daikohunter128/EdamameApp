class Visitor::TopController < Visitor::Base
  def index
    redirect_to :customer_root
    #render action: 'index'
  end
end
