class AddressFormPresenter < FormPresenter
  def postal_code_block(name, label_text, options)
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << text_field(name, options)
      m.span '(7桁の半角英数字で入力してください。)', class: 'notes'
      m << error_messages_for(name)
    end
  end
  
  #def drop_down_list_block(name, label_text, choices, options = {})
    #markup(:div, class: 'input-block') do |m|
      #m << decorated_label(name, label_text, options)
      #m << form_builder.select(name, choices, options)
      #m << error_messages_for(name)
    #end
  #end
end