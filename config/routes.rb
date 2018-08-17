# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/:locale' do
    resources :people
    resources :contacts
    resources :bookings
    root 'bookings#index'
  end
  root 'bookings#index'
  get 'icalendar', to: 'bookings#ical'
  # see http://guides.rubyonrails.org/routing.html
end
