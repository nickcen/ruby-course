class ApplicationController < ActionController::Base
  before_action :authenticate_worker!
  protect_from_forgery with: :exception
end
