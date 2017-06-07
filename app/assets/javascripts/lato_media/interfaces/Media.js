var Media = (function () {

  function open (modalId, event) {
    // open the correct modal
    Modal.open(modalId + '-modal')
    // add listener on image click
    addListenerToSingleMedia(modalId)
    // prevent the event
    if (event) {
      event.preventDefault()
    }
  }

  function addListenerToSingleMedia (modalId) {
    var singleMediaIdentifier = '#' + modalId + '-modal .cells-inputs-media__media-single'
    $(document).on('click', singleMediaIdentifier, function () {
      // find media informations
      var mediaId = $(this).attr('data-media-id')
      var mediaTitle = $(this).attr('data-media-title')
      var mediaImage = $(this).attr('data-media-image')
      var mediaImageUrl = $(this).attr('data-media-image-url')
      // update style
      $('.cells-inputs-media__media-single').removeClass('cells-inputs-media__media-single--active')
      $(this).addClass('cells-inputs-media__media-single--active')
    })
  }

  return {
    open: open
  }

})()