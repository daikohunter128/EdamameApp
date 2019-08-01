require 'spec_helper'

feature '顧客による顧客管理' do
  include FeaturesSpecHelper
  let(:customer) { create(:customer) }
  let!(:customer) { create(:customer) }
  
  befor do
    switch_namespace(:customer)
    login_as_customer(customer)
  end
  
  scenario '顧客が顧客、自宅住所を編集する' do
    click_link '顧客管理'
    first('table.listing').click_link '編集'
    
    fill_in 'メールアドレス', with: 'test@example.jp'
    within('fieldset#home-address-fields') do
      fill_in '郵便番号', with: '9999999'
    end
    click_button '更新'
    
    customer.reload
    expect(customer.email).to eq('test@example.jp')
    expect(customer.homeaddress.postal_code).to eq('9999999')
  end
end