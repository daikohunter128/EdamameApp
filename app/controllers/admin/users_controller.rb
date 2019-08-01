class Admin::UsersController < Admin::Base
  def edit
    @administrator = current_administrator
  end
  
  def update
    @administrator = current_administrator
    @administrator.assign_attributes(administrator_params)
    if @administrator.save
      flash.notice = '売り切れ表示に設定しました。'
      redirect_to :admin_root
    else
      render action: 'edit'
    end
  end
  
  private
  def administrator_params
    params.require(:administrator).permit(:stock)
  end
end
