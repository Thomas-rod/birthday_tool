class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  include Pundit



    # Pundit: white-list approach.
    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    # Uncomment when you *really understand* Pundit!
    # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    # def user_not_authorized
    #   flash[:alert] = "You are not authorized to perform this action."
    #   redirect_to(root_path)
    # end


    #-----------------------------------#
              protected
    #------------------------------------#

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :gender, :birthday_date])
    end

    def after_sign_in_path_for(resource_or_scope)
      if current_user.profil.nil?
        onboarding_path
      else
        friends_path
      end
    end

    def after_sign_up_path_for(resource_or_scope)
      if current_user.profil.nil?
        onboarding_path
      else
        friends_path
      end
    end

    def after_sign_out_path_for(resource)
      root_path
    end


    private

    def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end
end
