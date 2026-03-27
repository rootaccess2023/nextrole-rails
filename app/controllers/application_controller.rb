class ApplicationController < ActionController::Base
  include JwtAuthenticatable

  protect_from_forgery with: :null_session
end