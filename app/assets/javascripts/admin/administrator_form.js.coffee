$(document).on 'turbolinks:load', ->
  $('form.edit_customer').on 'click', '#enable-password-field', ->
    $('#enable-password-field').hide()
    $('#disable-password-field').show()
    $('#customer_password').removeAttr('disabled')
    $('label[for=customer_password]').addClass('required')
  $('form.edit_customer').on 'click', '#disable-password-field', ->
    $('#disable-password-field').hide()
    $('#enable-password-field').show()
    $('#customer_password').attr('disabled', 'disabled')
    $('label[for=customer_password]').removeClass('required')
 
toggle_home_address_fields = ->
  checked = $('input#form_inputs_home_address').prop('checked')
  $('fieldset#home-address-fields input').prop('disabled', !checked)
  $('fieldset#home-address-fields select').prop('disabled', !checked)
  $('fieldset#home-address-fields').toggle(checked)
