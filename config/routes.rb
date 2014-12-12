Rails.application.routes.draw do

  namespace :admin do
    root :to => "home#index"
  end


  require 'api'
  mount CheckinApi::API => '/'

end
