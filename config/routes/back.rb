# medias
resources :medias, module: 'back'
get 'medias_extra/refresh_index', to: 'back/medias#refresh_index', as: 'medias_refresh_index'

# cells
get 'cells/inputs_media_pagination', to: 'back/cells#inputs_media_pagination', as: 'cells_inputs_media_pagination'
get 'cells/inputs_media_select', to: 'back/cells#inputs_media_select', as: 'cells_inputs_media_select'