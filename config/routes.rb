# frozen_string_literal: true

Rails.application.routes.draw do
  root 'bookings#index'
  get 'ical', to: 'calendar#ical'
  get 'overview', to: 'calendar#overview'
  get 'calendar', to: 'calendar#calendar'
  get 'demo', to: 'calendar#demo'
  ActiveAdmin.routes(self)
  scope '/:locale' do
    devise_for :users, controllers: {
      registrations: 'devise/registrations'
    }.merge(ActiveAdmin::Devise.config)
    # resources :people
    # resources :contacts
    resources :bookings
    get 'unauthorized', to: 'users/unauthorized#unauthorized'
  end
  # see http://guides.rubyonrails.org/routing.html
end
