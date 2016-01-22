class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  private
  def after_sign_in_path_for(_resource_or_scope)
    home_index_path
  end
end
