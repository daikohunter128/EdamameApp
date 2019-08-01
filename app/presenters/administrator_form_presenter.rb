class AdministratorFormPresenter < UserFormPresenter
  def check_boxes
    narkup(:div, class: 'input-block') do |m|
      m << check_box(:suspended)
      m << label(:suspended, 'アカウント停止')
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