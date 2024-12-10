# frozen_string_literal: true

module ::DiscoursePluginAnonymizeUser
  class AnonymizeController < ::ApplicationController
    requires_plugin PLUGIN_NAME
    requires_login

    def index
    end

    def getanonymize
      render json: { error: "You need to use PUT request" }
    end

    def anonymize
      @user = User.find_by(id: params[:id])

      guardian.ensure_can_anonymize_user!(@user)
      opts = {}
      opts[:anonymize_ip] = "0.0.0.0"

      if user = UserAnonymizer.new(@user, current_user, opts).make_anonymous
        render json: success_json.merge(username: user.username)
      else
        render json: failed_json.merge(username: user.username)
      end
    end
  end
end
