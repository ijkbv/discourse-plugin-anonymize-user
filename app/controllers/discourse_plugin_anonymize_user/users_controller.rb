# frozen_string_literal: true

module ::DiscoursePluginAnonymizeUser
  class UsersController < ::ApplicationController
    requires_plugin PLUGIN_NAME
    requires_login
    before_action :ensure_staff

    def index
      head 201
    end

    def getanonymize
      head 202
    end

    def getanonymize2
      head 203
    end

    def anonymize
      params.require(:id)
      begin
        @user = User.find_by(id: params[:id])
        raise Discourse::NotFound unless @user

        guardian.ensure_can_anonymize_user!(@user)
        opts = {}
        opts[:anonymize_ip] = "0.0.0.0"

        if user = UserAnonymizer.new(@user, current_user, opts).make_anonymous
          render json: success_json.merge(username: user.username)
        else
          render json: failed_json.merge(user: AdminDetailedUserSerializer.new(user, root: false).as_json)
        end
      end
    end
  end
end
