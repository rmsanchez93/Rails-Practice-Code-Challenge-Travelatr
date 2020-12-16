Rails.application.routes.draw do
  resources :bloggers, only: [:new, :create, :show]
  resources :posts, only: [:new, :create, :show, :edit, :update]
  resources :destinations, only: [:show]

  post "posts/:id/like_post", to: "posts#like", as: "like_post"
end
