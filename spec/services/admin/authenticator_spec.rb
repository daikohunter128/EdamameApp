require 'rails_helper'

describe Admin::Authenticator do
  describe '#authenticator' do
    example '正しいパスワードならtrueをかえす' do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate('pw')).to be_truthy
    end
    
    example '誤ったパスワードならfalseをかえす' do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate('xy')).to be_falsey
    end
    
    example 'パスワード未設定ならfalseをかえす' do
      m = build(:administrator, password: nil)
      expect(Admin::Authenticator.new(m).authenticate(nil)).to be_falsey
    end
    
    example '停止フラグが立っていればfalseをかえす' do
      m = build(:administrator, suspended: true)
      expect(Admin::Authenticator.new(m).authenticate('pw')).to be_falsey
    end
    
    example '開始前ならfalseを返す' do
      m = build(:administrator, start_date: Date.tomorrow)
      expect(Admin::Authenticator.new(m).authenticate('pw')).to be_falsey
    end
    
    example '終了後ならfalseを返す' do
      m = build(:administrator, end_date: Date.today)
      expect(Admin::Authenticator.new(m).authenticate('pw')).to be_falsey
    end
  end
end