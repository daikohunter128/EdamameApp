require 'rails_helper'

feature '管理者による顧客管理' do
  include FeaturesSpecHelper
  let(:administrator) { create(:administrator) }
  let!(:customer) { create(:customer) }
  
  before do
    switch_namespace(:admin)
    login_as_administrator(administrator)
  end
  
  scenario '管理者が顧客、自宅住所を登録する' do
    click_link '顧客管理'
    first('div.links').click_link '新規登録'
    
    fill_in 'メールアドレス', with: 'test@example.jp'
    fill_in 'パスワード', with: 'pw'
    fill_in 'form_customer_family_name', with: '試験'
    fill_in 'form_customer_given_name', with: '花子'
    fill_in 'form_customer_family_name_kana', with: 'シケン'
    fill_in 'form_customer_given_name_kana', with: 'ハナコ'
    within('fieldset#home-address-fields') do
      fill_in '郵便番号', with: '1000001'
      select '東京都', from: '都道府県'
      fill_in '市区町村', with: '千代田区'
      fill_in '町域、番地等', with: '千代田区1－1－1'
      fill_in '建物名、部屋番号等', with: ''
    end
    click_button '登録'
    
    new_customer = Customer.order(:id).last
    expect(new_customer.email).to eq('test@example.jp')
    expect(new_customer.home_address.postal_code).to eq('1000001')
  end
end
  