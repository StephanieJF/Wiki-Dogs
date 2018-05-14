class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: [:index, :show]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
end