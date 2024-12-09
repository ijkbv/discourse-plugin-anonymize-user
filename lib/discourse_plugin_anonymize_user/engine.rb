# frozen_string_literal: true

module ::DiscoursePluginAnonymizeUser
  class Engine < ::Rails::Engine
    engine_name PLUGIN_NAME
    isolate_namespace DiscoursePluginAnonymizeUser
  end
end
