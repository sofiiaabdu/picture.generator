class ApplicationController < ActionController::Base

  private
  # Overwriting the sign_out redirect path method
  # def after_sign_out_path_for(resource_or_scope)
  # end

  def after_sign_in_path_for(resource)
    user_path(current_user) #your path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,
                                                       :last_name,
                                                       :age,
                                                       :about,
                                                       :sex,
                                                       address_attributes: [ :city,
                                                                            :street,
                                                                            :house_member,
                                                                            :zip
                                                       ]
    ]
    )
  end

end
