# frozen_string_literal: true

module ::DiscoursePluginAnonymizeUser
  class UsersController < ::ApplicationController
    requires_plugin PLUGIN_NAME
    requires_login
    before_action :ensure_staff

    def index
    end

    def getanonymize
      render json: { hello: "getanonymize" }
    end

    def anonymize
      @user = User.find_by(id: params[:id])
      raise Discourse::NotFound unless @user

      guardian.ensure_can_anonymize_user!(@user)
      opts = {}
      opts[:anonymize_ip] = "0.0.0.0"

      if user = UserAnonymizer.new(@user, current_user, opts).make_anonymous
        opts = {}
      else
        opts = {}
      end
    end
  end
end
