namespace :doc do

  root 'doc#index'

  get 'cells_input_media', to: 'cells#input_media', as: 'cells_input_media'

end
