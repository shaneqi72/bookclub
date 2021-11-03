class ApplicationController < ActionController::Base

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :forbidden

    private

    def forbidden
        flash[:alert] = "You are not authorised to perform that action"
        redirect_to(request.referrer || root_path)
    end
end
