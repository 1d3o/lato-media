var MediaHelpers = (function () {

  // This function update the active style of a media preview on the inputs media modal.
  function inputsMediaUpdateActive (inputName) {
    // find inputs media
    var inputsMedia = $('#' + inputName)
    // find selected value
    var value = $(inputsMedia).find('.inputs-media__input').val()
    if (!value) { return }

    // find index
    var index = $(inputsMedia).find('.inputs-media__media-index')
    // manage style classes
    $(index).find('.inputs-media__media-single--active').removeClass('inputs-media__media-single--active')
    $(index).find('[data-media-id="' + value + '"]').addClass('inputs-media__media-single--active')
  }

  return {
    inputsMediaUpdateActive: inputsMediaUpdateActive
  }

})()