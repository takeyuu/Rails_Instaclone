Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'pictures#top'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :likes, only: [:show]
  resources :pictures do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
    resources :likes, only: [:create, :destroy]
    resources :coments, only: [:create]
  end
end
