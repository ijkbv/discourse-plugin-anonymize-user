# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do
  scope "foo" do
    get "/" => "users#index"
  end
end

Discourse::Application.routes.draw { mount ::DiscoursePluginAnonymizeUser::Engine, at: "anonymize-plugin" }
