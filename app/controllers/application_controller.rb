class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    return customer_path(current_user) if current_user.customer_role?
    return staff_path(current_user) if current_user.staff_role?

    Rails.logger.debug "not customer role"
    root_path
  end
end
