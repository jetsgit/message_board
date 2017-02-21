# $ ->
#   $('.modal').on 'shown.bs.modal', ->
#     $('form[data-validate]').enableClientSideValidations()

$(document).ready ->
  $(document).bind 'ajaxError', 'form#new_message', (event, jqxhr, settings, exception) -> # 'form#new_message'
    $(event.data).render_form_errors $.parseJSON(jqxhr.responseText)
    return

  $('.modal').on 'hidden.bs.modal', ->
    $(this).find('form')[0].reset()
    $(this).find('span.msg-error').text ''
    $(this).find('.has-error').removeClass()
    return
  return

(($) ->

  $.fn.modal_success = ->
    # close modal
    @modal 'hide'
    # clear form input elements
    @find('form input[type="text"]').val ''
    $("textarea#message_content").val ''
    # clear error state
    @clear_previous_errors()
    return

  $.fn.render_form_errors = (errors) ->
    $form = this
    @clear_previous_errors()
    model = @data('model')
    $.each errors, (field, messages) ->
      if (field == 'title' ) || (field == 'comment')
        mytag = $('input[name="' + model + '[' + field + ']"]')
        mytag.closest('.form-group').addClass('has-error')
        mytag.prev().after("<span class='msg-error'>&nbsp can't be blank</span>")
      else if field == 'content'
        mytag = $('textarea#message_content')
        mytag.closest('.form-group').addClass('has-error')
        mytag.prev().after("<span class='msg-error'>&nbsp can't be blank</span>")
      return
    return

  $.fn.clear_previous_errors = ->
    $('.form-group.has-error', this).each ->
      myspan = ''
      myspan = $(this).children('span')
      $(myspan).text ''
      $(this).removeClass 'has-error'
      return
    return
  return


  $.fn.modal_jet = ->
    $home = this
    # clear form input elements
    # @find('form input[type="text"]').val ''
    # $("textarea#message_content").val ''
    # clear error state
    # @clear_previous_errors()
    console.log "hi folks!"

) jQuery

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

