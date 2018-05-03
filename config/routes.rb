Rails.application.routes.draw do

  devise_for :users
 resources :blog_posts
 resources :comments, only: [:edit, :create, :update, :destroy]
 
 root 'blog_posts#index'

 get '/:name' => 'blog_posts#user_posts', as: :user_posts


# get '/:name' => 'blog_posts#user_posts', as: :user_posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
