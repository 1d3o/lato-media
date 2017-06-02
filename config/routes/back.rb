# medias
resources :medias, module: 'back'
get 'medias_extra/refresh_index', to: 'back/medias#refresh_index', as: 'medias_refresh_index'