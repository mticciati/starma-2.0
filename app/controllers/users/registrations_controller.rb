class Users::RegistrationsController < Devise::RegistrationsController
  
  # before_filter :combine_birthday, only: [:create]
  # before_action :configure_permitted_parameters, if: :devise_controller?

# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #    super
  # end

  # POST /resource
  # def create
  #   super 
  #   params[:birthday] = "#{params[:birthday_year]}:#{params[:birthday_month]}:#{params[:birthday_day]}"

  # end

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

  # private

  # def combine_birthday
  # #   # month = Date.parse(:birthday_month)
  # #   # day = Date.parse(:birthday_day)
  # #   # year = Date.parse(:birthday_year)
  #   params[:birthday] = "#{params[:birthday_year]}:#{params[:birthday_month]}:#{params[:birthday_day]}"
  #   debugger
 
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
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
