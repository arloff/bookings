# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/:locale' do
    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }
    # resources :people
    # resources :contacts
    resources :bookings
    root 'bookings#index'
    get 'ical', to: 'bookings#ical'
  end
  root 'bookings#index'
  # see http://guides.rubyonrails.org/routing.html
end
