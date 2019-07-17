Rails.application.routes.draw do
  root 'welcome#index'

  resource :feedback, only: [:show, :create]
end
