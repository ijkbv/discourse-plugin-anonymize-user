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
    end
  end
end
