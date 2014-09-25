Rails.application.routes.draw do
  mount Totec::API, at: '/api'
end
