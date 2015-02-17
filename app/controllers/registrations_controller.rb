class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Sorry, but registrations are closed.'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Sorry, but registrations are closed.'
    redirect_to root_path
  end
end