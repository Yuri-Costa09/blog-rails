class ApplicationController < ActionController::API
  before_action :authenticate_author!, unless: :devise_controller?
end
