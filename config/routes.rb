Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'restaurants#index'
  resources :restaurants do
    collection do
      get :top # /restaurants/top
      # get :closest # /restaurants/closest
      # get :smokefree # /restaurants/smokefree
    end

    member do
      get :chef # /restaurants/:id/chef
      # get :menu # /restaurants/:id/menu
      # get :cuisine # /restaurants/:id/cuisin
    end

    resources :reviews, only: [:create] # can remove :new page now since form is on show page
    # restaurants/:restaurant_id/reviews/new => reviews#new => C - Form
    # restaurants/:restaurant_id/reviews => reviews#create => C - process the form

    resources :dishes, only: [:new, :create, :edit, :update]
    # restaurants/:restaurant_id/dishes/new => dishes#new => C - Form
    # restaurants/:restaurant_id/dishes => dishes#create => C - process the form
    # restaurants/:restaurant_id/dishes/edit => dishes#edit => U - form
    # restaurants/:restaurant_id/dishes/update => dishes#update => U - process update form
  end

  resources :reviews, only: [:index] # /reviews
  resources :dishes, only: [:index] # /dishes
end
