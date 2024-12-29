class Users::RegistrationsController < Devise::RegistrationsController
  before_action :redirect_if_authenticated, only: [:new]

  private

  def redirect_if_authenticated
    if user_signed_in?
      redirect_to documents_path, alert: '既にログインしています。'
    end
  end
end