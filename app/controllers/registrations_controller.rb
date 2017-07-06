class RegistrationsController < Devise::RegistrationsController
  before_filter :authorize_admin, only: :create
  skip_before_filter :require_no_authentication, only: [:new, :create]

  def new
    super
  end

  def create
    super
  end

  private

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end
end
