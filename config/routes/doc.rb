namespace :doc do

  root 'doc#index'

  get 'cells_elements_mediaselector', to: 'cells#elements_mediaselector', as: 'cells_elements_mediaselector'
  get 'cells_inputs_media', to: 'cells#inputs_media', as: 'cells_inputs_media'

end
