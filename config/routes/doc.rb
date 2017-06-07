namespace :doc do

  root 'doc#index'

  get 'cells_elements_preview', to: 'cells#elements_preview', as: 'cells_elements_preview'
  get 'cells_inputs_media', to: 'cells#inputs_media', as: 'cells_inputs_media'

end
