namespace :doc do

  root 'doc#index'

  get 'cells_inputs_media', to: 'cells#inputs_media', as: 'cells_inputs_media'

end
