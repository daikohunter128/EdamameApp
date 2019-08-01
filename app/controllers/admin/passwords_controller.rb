class Admin::PasswordsController < Admin::Base
  def show
    redirect_to :edit_admin_password
  end
  
  def edit
    @change_password_form =
      Admin::ChangePasswordForm.new(object: current_administrator)
  end
  
  def update
    @change_password_form = Admin::ChangePasswordForm.new(administrator_params)
    @change_password_form.object = current_administrator
    if @change_password_form.save
      flash.notice = 'パスワードを変更しました。'
      redirect_to :admin_account
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  private
  def administrator_params
    params.require(:admin_change_password_form).permit(:current_password, :new_password, :new_password_confirmation)
  end
end
