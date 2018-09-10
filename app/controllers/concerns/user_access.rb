module UserAccess
  extend ActiveSupport::Concern

  included do
    before_action :user_access, only: [:show, :index]
  end

  def user_access
    if current_user
      unless current_user.try(:admin?)
        unless user_id.to_i == current_user.id
          # unless @user == current_user && current_user.admin?
          redirect_to pictures_path
        end
      end
      end
    end
end