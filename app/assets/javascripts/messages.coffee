$(document).ready ->
  $(document).on 'ajaxError', 'form#new_message', (event, jqxhr, settings, exception) ->
    $(event.data).render_form_errors $.parseJSON(jqxhr.responseText)
    return
  return

(($) ->

  $.fn.modal_success = ->
    # close modal
    @modal 'hide'
    # clear form input elements
    @find('form input[type="text"]').val ''
    # @find('form input["type=textarea"]').val ''
    # clear error state
    @clear_previous_errors()
    return
    
  $.fn.render_form_errors = (errors) ->
    $form = this
    @clear_previous_errors()
    model = @data('model')
    $.each errors, (field, messages) ->
      $input = $('input[name="' + model + '[' + field + ']"]')
      $input.closest('.form-group').addClass('has-error').find('.help-block').html messages.join(' & ')
      return
    return

  $.fn.clear_previous_errors = ->
    $('.form-group.has-error', this).each ->
      $('.help-block', $(this)).html ''
      $(this).removeClass 'has-error'
      return
    return
  return
) jQuery

# $("form.new_message").on "ajax:error", (event, xhr, status, error) ->
#   errors = jQuery.parseJSON(xhr.responseText)
#   errorcount = errors.length
#   $('#error_explanation').empty()
#   if errorcount > 1
#     $('#error_explanation').append('<div class="alert alert-error">The form contains ' + errorcount + ' errors.</div>')
#   else
#     $('#error_explanation').append('<div class="alert alert-error">The form contains 1 error</div>')
#   $('#error_explanation').append('<ul>')
#   for e in errors
#     $('#error_explanation').append('<li>' + e + '</li>')
#   $('#error_explanation').append('</ul>')
#   $('#error_explanation').show()


$ ->
  $.rails.allowAction = (link) ->
    return true unless link.attr('data-confirm')
    $.rails.showConfirmDialogue(link)
    false

  $.rails.confirmed = (link) ->
    link.removeAttr('data-confirm')
    link.trigger('click.rails')

  $.rails.showConfirmDialogue = (link) ->
    message = link.attr 'data-confirm'
    html = """
           <div class="modal" id="confirmationDialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <a class="close" data-dismiss="modal">×</a>
                    <h4><i class="glyphicon glyphicon-trash"></i>  #{message}</h4>
                  </div>
                  <div class="modal-footer">
                    <a data-dismiss="modal" class="btn">Cancel</a>
                    <a data-dismiss="modal" class="btn btn-danger confirm">Ok</a>
                  </div>
                </div>
              </div>
            </div>
          """
    $(html).modal('show')
    $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)

