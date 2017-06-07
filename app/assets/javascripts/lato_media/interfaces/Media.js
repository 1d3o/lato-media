var Media = (function () {

  function open (modalId, event) {
    // open the correct modal
    Modal.open(modalId + '-modal')
    // add listener on image click
    var modal = $('#' + modalId + '-modal')
    $(modal).find('.cells_inputs-media__media-single').click((function () {
      $('.cells_inputs-media__media-single').removeClass('cells_inputs-media__media-single--active')
      $(this).addClass('cells_inputs-media__media-single--active')
    }))
    // prevent the event
    if (event) {
      event.preventDefault()
    }
  }

  return {
    open: open
  }

})()