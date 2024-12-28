class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = User.find_by(employee_number: params[:user][:employee_number])
    if resource&.valid_password?(params[:user][:password])
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      set_flash_message!(:alert, :invalid)
      redirect_to new_session_path(resource_name)
    end
  end
end