var MediaSelector = (function () {

  // This is the main function used to active the media selector.
  // The inputId is the input used by the selector to save the selected data.
  // The maxItems is a possible option used to set how many images can be selected.
  function open (inputId, maxItems) {
    if (!maxItems) { maxItems = 1 }
    // listen events on modal
    _listenLoadIndexAction(inputId, maxItems)
    // load index for media selector
    runAction('load_index')
    // open the modal
    Modal.open('media__media_selector')
  }

  // This function closes the media selector and remove all event watcher on it.
  function close (inputId) {
    // remove event listener
    $('#media__media_selector').unBind('loadIndexAction')
    // close the modal
    Modal.close('media__media_selector')
  }

  // This function run a single action for the media selector.
  function runAction (action) {
    $('.partials__media-selector-actions #' + action).trigger('click')
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
        _updateInput(mediaId, inputId, maxItems)
        _updateActiveMedias(inputId)
      })
    })
  }

  // This function update the input with a specific id to add / remove a media.
  function _updateInput (mediaId, inputId, maxItems) {
    // find input informations
    var input = $('#' + inputId)
    var inputValue = $(input).val()
    var selectedMedias = inputValue.split(',')
    // update selected medias
    var mediaIndex = selectedMedias.indexOf(mediaId)
    if (mediaIndex > -1) {
      selectedMedias.splice(mediaIndex, 1)
    } else {
      if (selectedMedias.length >= maxItems) {
        alert('You can not select other medias')
        return
      }
      selectedMedias.push(mediaId)
    }
    // update input value
    $(input).val(selectedMedias.join())
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
    close: close,
    runAction: runAction
  }

})()