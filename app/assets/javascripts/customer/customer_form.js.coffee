$(document).on 'turbolinks:load', ->
  toggle_home_address_feelds()
  $('input#form_inputs_home_address').on 'click', ->
    toggle_home_address_fields()
    
toggle_home_address_fields = ->
  checked = $('input#form_inputs_home_address').prop('checked')
  $('fieldset#home-address-fields input').prop('disabled', !checked)
  $('fieldset#home-address-fields select').prop('disabled', !checked)
  $('fieldset#home-address-fields').toggle(checked)
