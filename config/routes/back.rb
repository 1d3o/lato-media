# medias
resources :medias, module: 'back'
get 'medias_extra/refresh_index', to: 'back/medias#refresh_index', as: 'medias_refresh_index'

# media selector (helpers for the partial work)
get 'media_selector/load_index', to: 'back/media_selector#load_index', as: 'media_selector_load_index'
get 'media_selector/load_inputs_media', to: 'back/media_selector#load_inputs_media', as: 'media_selector_load_inputs_media'
get 'media_selector/load_inputs_gallery', to: 'back/media_selector#load_inputs_gallery', as: 'media_selector_load_inputs_gallery'