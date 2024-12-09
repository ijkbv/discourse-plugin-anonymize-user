# frozen_string_literal: true

module ::DiscoursePluginAnonymizeUser
  class Engine < ::Rails::Engine
    engine_name "discourse-plugin-anonymize-user"
    isolate_namespace DiscoursePluginAnonymizeUser
  end
end
