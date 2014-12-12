Rails.application.routes.draw do

  require 'api'
  mount CheckinApi::API => '/'

end
