var MediaInputsInitializer = (function () {

  function initializeMedia () {
    console.log('initialize')
    $('.inputs-media .inputs-media__input').change(function () {
      // get utils data
      var id = $(this).attr('id')
      var media = $('#inputs-media-' + id)
      var input = $(media).find('.inputs-media__input')
      var action = $(media).find('.inputs-media__reload')
      var value = $(input).attr('value')
      // generate new url
      var url = action.attr('href')
      url = _updateQueryStringParameter(url, 'id', id)
      url = _updateQueryStringParameter(url, 'value', value)
      // update url and send request
      $(action).attr('href', url)
      $(action).trigger('click')
    })
  }

  function _updateQueryStringParameter(uri, key, value) {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
      return uri.replace(re, '$1' + key + "=" + value + '$2');
    }
    else {
      return uri + separator + key + "=" + value;
    }
  }

  // Init:

  function init () {
    initializeMedia()
  }

  return {
    init: init
  }

})()