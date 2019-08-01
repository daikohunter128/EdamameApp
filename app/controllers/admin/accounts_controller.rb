class Admin::AccountsController < Admin::Base
  def show
    @administrator = current_administrator
  end
  
  def edit
    @administrator = current_administrator
  end
  
  def update
    @administrator = current_administrator
    @administrator.assign_attributes(administrator_params)
    if @administrator.save
      flash.notice = 'アカウント情報を更新しました。'
      redirect_to :admin_account
    else
      render action: 'edit'
    end
  end
  
  private
  def administrator_params
    params.require(:administrator).permit(:email, :family_name, :given_name, :family_name_kana, :given_name_kana, :stock)
  end
end
