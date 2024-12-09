# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do

end

Discourse::Application.routes.draw { mount ::DiscoursePluginAnonymizeUser::Engine, at: "anonymize-plugin" }
