class Customer < ActiveRecord::Base
  include EmailHolder
  include PersonalNameHolder
  include PasswordHolder
  
  has_many :addresses
  has_one :address, dependent: :destroy, autosave: true
  #has_many :phones, dependent: :destroy
  has_many :personal_phones, class_name: 'Phone', dependent: :destroy, autosave: true
  #has_many :personal_phones,dependent: :destroy, autosave: true
  #has_many :histories, class_name: 'History', dependent: :destroy, autosave: true
end
