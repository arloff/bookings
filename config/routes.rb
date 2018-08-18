# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  scope '/:locale' do
    # resources :people
    # resources :contacts
    resources :bookings
    root 'bookings#index'
  end
  root 'bookings#index'
  get 'ical', to: 'bookings#ical'
  # see http://guides.rubyonrails.org/routing.html
end
