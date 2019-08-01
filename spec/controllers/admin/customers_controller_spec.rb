require 'rails_helper'

describe Admin::CustomersController do
  let (:params_hash) { attributes_for(:customer) }
  
  describe '#create' do
    example 'kokyaku一覧ページにリダイレクト' do
      post :create, params_hash(customer: params_hash)
      expect(response).to redirect_to(admin_customer_url)
    end
    
    example '例外ActionController::ParameterMissingが発生' do
      bypass_rescue
      expect { post :create }.to raise_error(ActionController::ParameterMissing)
    end
  end
end
