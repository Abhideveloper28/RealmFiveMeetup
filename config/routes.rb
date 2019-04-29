Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'

  resources :groups
  post 'groups/import', to: 'groups#import'
  get  'create_group', to: 'groups#create_group'
  get  'download_csv',  to: 'groups#download'
end
