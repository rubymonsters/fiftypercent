class Admin::BaseController < ApplicationController
  before_action :authenticate_user
  layout 'admin'
  # force_ssl if: :use_ssl?

  protected
    def authenticate_user
      redirect_to log_in_path unless current_user
    end

    def use_ssl?
      !Rails.env.test?
    end
end
