class Admin::TopController < Admin::Base
  skip_before_action :authorize
  def index
    @stock = Administrator.find(1)
    if current_administrator
      render action: 'dashboard'
    else
      render action: 'index'
    end
  end
end
