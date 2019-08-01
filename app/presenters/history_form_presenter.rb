class HistoryFormPresenter < UserFormPresenter
  def reservation_field_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << text_field(name, options)
      m.span '(注文量を選択してください。)', class: 'notes'
      m << error_messages_for(name)
    end
  end
  
  def purchase_field_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
  
  def reservation_history_field_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
  
  def undispatched_field_block(name, label_text, options = {})
    markup(:div, class: 'input-block') do |m|
      m << text_field(name, options)
      m << error_messages_for(name)
    end
  end
  
  def drop_down_list_block(name, label_text, choices, options = {})
    markup(:div, class: 'input-block') do |m|
      m << decorated_label(name, label_text, options)
      m << form_builder.select(name, choices, options)
      m.span 'kg', class: 'notes'
      m << error_messages_for(name)
    end
  end
end