var MediaSelector = (function () {

  // This is the main function used to active the media selector.
  // The inputId is the input used by the selector to save the selected data.
  // The maxItems is a possible option used to set how many images can be selected.
  function open (inputId, maxItems, event) {
    if (!maxItems) { maxItems = 1 }
    if (event) { event.preventDefault() }
    // listen events on modal
    _listenLoadIndexAction(inputId, maxItems)
    _listenCancelButtonAction(inputId)
    _listenListButtonAction(inputId)
    _listenAddButtonAction(inputId)
    // load index for media selector
    _reloadIndex()
    // open the modal
    Modal.open('media__media_selector')
  }

  // This function closes the media selector and remove all event watcher on it.
  function close (event) {
    if (event) { event.preventDefault() }
    // remove event listener
    $('#media__media_selector').unbind('loadIndexAction')
    $('#media__media_selector_cancel_button').unbind('click')
    // close the modal
    Modal.close('media__media_selector')
  }

  // This function reload the index list for the medias.
  function _reloadIndex () {
    $('#media__media_selector_load_index').trigger('click')
  }

  // This functions listens the dom cha on the media selector and run the correct actions.
  function _listenLoadIndexAction (inputId, maxItems) {
    $('#media__media_selector').bind('loadIndexAction', function () {
      // update active medias
      _updateActiveMedias(inputId)
      // listen medias click action
      var medias = $('#media__media_selector .partials__media-selector-index-list .elements-preview')
      $(medias).click(function () {
        var mediaId = $(this).attr('data-media-id')
        // update input with selected medias
        _updateInput(mediaId, inputId, maxItems)
        // update view for selected media
        _updateActiveMedias(inputId)
      })
    })
  }

  // This function listens the click on cancel button to clear the input.
  function _listenCancelButtonAction (inputId) {
    $('#media__media_selector_cancel_button').bind('click', function (e) {
      e.preventDefault()
      var input = $('#' + inputId)
      $(input).val('')
      $(input).trigger('change')
      close()
    })
  }

  // This function listens the click on add button to update the input.
  function _listenAddButtonAction (inputId) {
    $('#media__media_selector_add_button').bind('click', function (e) {
      e.preventDefault()
      $('#media__media_selector_load_form').trigger('click')
    })
  }

  // This function listens the click on add button to update the input.
  function _listenListButtonAction (inputId) {
    $('#media__media_selector_list_button').bind('click', function (e) {
      e.preventDefault()
      $('#media__media_selector_load_index').trigger('click')
    })
  }

  // This function update the input with a specific id to add / remove a media.
  function _updateInput (mediaId, inputId, maxItems) {
    // find input informations
    var input = $('#' + inputId)
    var inputValue = $(input).val()
    var selectedMedias = inputValue ? inputValue.split(',') : []
    // update selected medias
    var mediaIndex = selectedMedias.indexOf(mediaId)
    if (mediaIndex > -1) {
      selectedMedias.splice(mediaIndex, 1)
    } else {
      if (maxItems > 1 && selectedMedias.length >= maxItems) {
        alert('You can not select other medias')
        return
      }
      if (maxItems > 1) {
        selectedMedias.push(mediaId)
      } else {
        selectedMedias = [mediaId]
      }
    }
    // update input value
    $(input).val(selectedMedias.join())
    $(input).trigger("change") // manually trigger change event
  }

  // This function update the style to show active medias.
  function _updateActiveMedias (inputId) {
    // find inputs informations
    var input = $('#' + inputId)
    var inputValue = $(input).val()
    var selectedMedias = inputValue.split(',')
    // update style
    var medias = $('#media__media_selector .partials__media-selector-index-list .elements-preview')
    $(medias).each(function () {
      var mediaId = $(this).attr('data-media-id')
      if (selectedMedias.indexOf(mediaId) > -1) {
        $(this).addClass('elements-preview--active')
      } else {
        $(this).removeClass('elements-preview--active')
      }
    })
  }

  return {
    open: open,
    close: close
  }

})()