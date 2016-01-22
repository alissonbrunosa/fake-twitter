class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def check_for_existing_username
    render json: { found: User.find_by_username(params[:username]).present? }
  end

  protected

  def configure_sign_up_params
    additional_params = [:name]
    devise_parameter_sanitizer.for(:sign_up).concat(additional_params)
  end

  def configure_account_update_params
    additional_params = [:first_name, :last_name, :email, :timezone]
    devise_parameter_sanitizer.for(:account_update).concat(additional_params)
  end
end
