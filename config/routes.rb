Rails.application.routes.draw do
  # What is this? You can chain resources together like this? Magic! This is a little overkill, we don't really need all these routes and paths but I start with them all anyways and, in my own projects, filter out what we need later on.
  resources :posts, :destinations, :bloggers
  # This is the custom path for the like button. It's a post called from within the show page of one post, that I want to call the like action I created in the Posts controller. I named the path like_path, this is seen in the button in my Post show page.
  post '/posts/:id/like', to: 'posts#like', as: 'like'
end
