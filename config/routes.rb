Rails.application.routes.draw do
  resources :posts, :destinations, :bloggers
  post "/posts/:id/like", to: 'posts#like', as: 'like'
end
