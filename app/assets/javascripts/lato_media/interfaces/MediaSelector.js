var MediaSelector = (function () {

  // This is the main function used to active the media selector.
  // The inputId is the input used by the selector to save the selected data.
  // The maxItems is a possible option used to set how many images can be selected.
  function open (inputId, maxItems) {
    if (!maxItems) { maxItems = 1 }
    // open the modal
    Modal.open('media__media_selector')
  }

  return {
    open: open
  }

})()