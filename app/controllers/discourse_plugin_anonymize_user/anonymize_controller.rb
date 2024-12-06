# frozen_string_literal: true

module ::DiscoursePluginAnonymizeUser
  class AnonymizeController < ::Admin::AdminController #::ApplicationController
    requires_plugin PLUGIN_NAME

    def index
      render json: { hello: "world" }
    end

    def anonymizefull
      render json: { hello: "anonymizefull" }
    end
  end
end
