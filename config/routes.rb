Rails.application.routes.draw do

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}
  
  # match ':controller(/:action(/:id))', :via => :get

  patch 'pics/updateTags/:id', to: 'pics#updateTags', as: :updateTags
  resources :pics 

  get 'tags/:tag', to: 'pics#index', as: :tag
  get 'autocomplete-tags' => 'tags#autocomplete'
  get 'popular-tags' => 'tags#popular'

  root 'pics#index'

end
