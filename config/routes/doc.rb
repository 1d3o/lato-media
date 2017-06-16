namespace :doc do

  root 'doc#index'

  # general
  get 'general_installation', to: 'general#installation', as: 'general_installation'
  get 'general_personalization', to: 'general#personalization', as: 'general_personalization'

  # cells
  get 'cells_elements_preview', to: 'cells#elements_preview', as: 'cells_elements_preview'
  get 'cells_inputs_media', to: 'cells#inputs_media', as: 'cells_inputs_media'
  get 'cells_inputs_gallery', to: 'cells#inputs_gallery', as: 'cells_inputs_gallery'

end
