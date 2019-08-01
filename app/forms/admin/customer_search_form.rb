class Admin::CustomerSearchForm
  include ActiveModel::Model
  include StringNormalizer
  
  attr_accessor :family_name_kana, :given_name_kana,
    :address_type, :prefecture, :city, :postal_code, :nick_name, :phone_number, :last_four_digits
  
  def search
    normalize_values
    
    rel = Customer
    if family_name_kana.present?
      rel = rel.where(family_name_kana: family_name_kana)
    end
    if given_name_kana.present?
      rel = rel.where(given_name_kana: given_name_kana)
    end
    if nick_name.present?
      rel = rel.where(nick_name: nick_name)
    end
    
    if prefecture.present? || city.present? || postal_code.present?
      case address_type
      when ''
        rel = rel.joins(:addresses)
      when 'home'
        rel = rel.joins(:home_address)
      else
        raise
      end
      if prefecture.present?
        rel = rel.where('addresses.prefecture' => prefecture)
      end
      rel = rel.where('addresses.city' => city) if city.present?
      if postal_code.present?
        rel = rel.where('addresses.postal_code' => postal_code)
      end
    end
    
    if phone_number.present? || last_four_digits.present?
      rel = rel.joins(:phones)
      if phone number.present?
        rel = rel.where('phones.last_four_index' => phone_number)
      end
      if last_four_digits.present?
        rel = rel.where('phones.last_four_digits' => last_four_digits)
      end
    end
    rel = rel.distinct
    rel.order(:family_name_kana, :given_name_kana)
  end
  
  private
  def normalize_values
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
    self.nick_name = normalize_as_furigana(nick_name)
    self.city = normalize_as_name(city)
    self.postal_code = normalize_as_postal_code(postal_code)
    self.phone_number = normalize_as_phone_number(phone_number).try(:gsub, /\D/, '')
  end
end