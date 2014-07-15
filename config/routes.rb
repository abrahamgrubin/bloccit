Bloccit::Application.routes.draw do

  get "comments/create"
  devise_for :users
  resources :users, only: [:show, :update]
  resources :topics do
	resources :posts, except: [:index], controller: 'topics/post' 
  end

  resources :posts, only:[:index] do 
		resources :comments, only: [:create, :destroy]
		get '/up-vote' => 'votes#up_vote', as: :up_vote
		get '/down-vote' => 'votes#down_vote', as: :down_vote
    resources :favorites, only: [:create, :destroy ]
	end
  
  get 'about' => 'welcome#about'
 
  root to: 'welcome#index'
end
