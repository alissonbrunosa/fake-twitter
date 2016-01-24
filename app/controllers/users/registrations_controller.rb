class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_sign_up_params
    additional_params = [:name]
    devise_parameter_sanitizer.for(:sign_up).concat(additional_params)
  end

  def configure_account_update_params
    additional_params = [:name, :email, :timezone]
    devise_parameter_sanitizer.for(:account_update).concat(additional_params)
  end

  def after_update_path_for(resource)
    home_index_path
  end
end
