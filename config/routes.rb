Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'notes#index'

      resources :notes, except: [:new, :edit]
    end
  end
end
