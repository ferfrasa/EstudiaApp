# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]
   

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
     super 
      sign_in_count 
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end
  

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
    puts "entro"
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
   end
   def sign_in_count
    current_user.increment!(:sign_in_count)
   end
   
end
