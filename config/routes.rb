# frozen_string_literal: true

Rails.application.routes.draw do
  root 'bookings#index'
  get 'ical', to: 'calendar#ical'
  ActiveAdmin.routes(self)
  scope '/:locale' do
    devise_for :users, controllers: {
      registrations: 'devise/registrations'
    }.merge(ActiveAdmin::Devise.config)
    # resources :people
    # resources :contacts
    resources :bookings
<<<<<<< HEAD
    get 'unauthorized', to: 'users/unauthorized#unauthorized'
=======
    get 'calendar', to: 'calendar#calendar'
    root 'bookings#index'
>>>>>>> wip
  end
  # see http://guides.rubyonrails.org/routing.html
end
