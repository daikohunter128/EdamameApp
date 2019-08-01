class Admin::SessionsController < Admin::Base
  skip_before_action :authorize
  
  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: 'new'
    end
  end
  
  def create
    @form = Admin::LoginForm.new(admin_login)
    if @form.email.present?
      administrator = Administrator.find_by(email_for_index: @form.email.downcase)
    end
    
    if Admin::Authenticator.new(administrator).authenticate(@form.password)
      session[:administrator_id] = administrator.id
      session[:last_access_time] = Time.current
      flash.notice = 'ログインしました。'
      redirect_to :admin_root
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end
  
  def destroy
    session.delete(:administrator_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :admin_root
  end
  
  private
  def admin_login
    params.require(:admin_login_form).permit(:email, :password)
  end
end
