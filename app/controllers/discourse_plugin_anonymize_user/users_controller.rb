# frozen_string_literal: true

module DiscoursePluginAnonymizeUser
  class UsersController < ::ApplicationController
    requires_plugin PLUGIN_NAME
    requires_login
    before_action :ensure_staff

    def index
    end

    def anonymize
      @user = User.find_by(id: params[:id])
      raise Discourse::NotFound unless @user

      guardian.ensure_can_anonymize_user!(@user)
      opts = {}
      opts[:anonymize_ip] = "0.0.0.0"

      if user = UserAnonymizer.new(@user, current_user, opts).make_anonymous
        # Sleep 1 second, otherwise the rebake is too soon
        sleep(1)

        # Rebake all posts where the user is mentioned to refresh excerpts
        # Post.where("raw LIKE ?", "%@#{@user.username}%").find_each do |post|
        #   post.rebake!
        # end
        render json: success_json.merge(username: user.username)
      else
        render json: failed_json.merge(username: user.username)
      end
    end
  end
end
