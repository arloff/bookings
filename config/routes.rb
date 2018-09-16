# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  scope '/:locale' do
    devise_for :users, controllers: {
      registrations: 'devise/registrations'
    }.merge(ActiveAdmin::Devise.config)
    # resources :people
    # resources :contacts
    resources :bookings
    root 'bookings#index'
    get 'ical', to: 'bookings#ical'
    get 'unauthorized', to: 'users/unauthorized#unauthorized'
  end
  root 'bookings#index'
  # see http://guides.rubyonrails.org/routing.html
end
