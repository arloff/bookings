# frozen_string_literal: true

Rails.application.routes.draw do
  resources :people
  resources :contacts
  resources :bookings
  root 'bookings#index'
  # see http://guides.rubyonrails.org/routing.html
end
