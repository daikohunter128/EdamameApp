module FeaturesSpecHelper
  def switch_namespace(namespace)
    config = Rails.application.config.edamame
    Capybara.app_host = 'http://' + config[namespace][:host]
  end
  
  def login_as_administrator(administrator, password = 'pw')
    visit admin_login_path
    within('#login-form') do
      fill_in 'メールアドレス', with: administrator.email
      fill_in 'パスワード', with: password
      click_button 'ログイン'
    end
  end
end