class CustomerPresenter < ModelPresenter
  delegate :email, to: :object
  
  def email
    object.email
  end
  
  def full_name
    object.family_name + ' ' + object.given_name
  end
  
  def full_name_kana
    object.family_name_kana + ' ' + object.given_name_kana
  end
  
  def nick_name
    object.nick_name
  end
  
  def personal_phones
    object.personal_phones.map(&:number)
  end
end
