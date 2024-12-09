# frozen_string_literal: true

module ::DiscoursePluginAnonymizeUser
  class UsersController < ::ApplicationController
    requires_plugin PLUGIN_NAME

    def index
      puts "index"
      head 200
    end

    def getanonymize
      puts "getanonymize"
      head 200
    end

    def getanonymize2
      puts "getanonymize2"
      head 200
    end

    def anonymize
      puts "anonymize"
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
