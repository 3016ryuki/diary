Rails.application.routes.draw do
  resources :diaries do
    collection do
      get 'search'
    end
  end
end
