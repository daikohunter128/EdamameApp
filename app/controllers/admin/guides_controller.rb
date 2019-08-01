class Admin::GuidesController < Admin::Base
  def introduction
    render action: 'introduction'
  end
end
