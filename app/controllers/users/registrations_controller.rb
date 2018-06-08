class Users::RegistrationsController < Devise::RegistrationsController
  include RegistrationsHelper
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  skip_before_action :verify_authenticity_token, :only => [:custom_account_creation]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
      build_resource(sign_up_params)
      attach_files @user
      resource.save

      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        error_messages = RegistrationsHelper.treat_error_messages resource
        flash[:warning] = error_messages
        redirect_to '/user/new'
        return
      end
    end

  # POST /resource
  def custom_account_creation
    # byebug
    random_user_password = Passgen::generate
    params[:user][:password] = random_user_password
    params[:user][:password_confirmation] = random_user_password
    create
  end

  def attach_files user
    user.patrimonial_balance = params[:user][:patrimonial_balance]
    user.dre_file = params[:user][:dre_file]
    user.social_contract = params[:user][:social_contract]
    user.business_licence = params[:user][:business_licence]
    user.cnpj_file = params[:user][:cnpj_file]
    # byebug
  end


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:password, :password_confirmation, :email, :telephone, :cpf, :company, :cnpj, :earnings_type, :earnings_range, :patrimonial_balance, :dre_file, :social_contract, :role, :opening_status, :business_licence, :cnpj_file, :personal_file, :protocol)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
