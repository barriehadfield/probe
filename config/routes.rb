Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # mount Hyperloop::Engine => '/hyperloop'
  root 'home#page'
  match '*all', to: 'home#page', via: [:get]
end
