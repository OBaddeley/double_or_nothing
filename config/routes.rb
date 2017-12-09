Rails.application.routes.draw do
  get 'game/index'

  get 'game/play'

  get 'game/validate'

  root 'game#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
