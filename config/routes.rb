# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do
  scope path: nil do
    namespace :users, constraints: StaffConstraint.new do
      get "/:id/anonymize" => "users#getanonymize"
      put "/:id/anonymize" => "users#anonymize"
    end
  end
end

Discourse::Application.routes.draw { mount ::DiscoursePluginAnonymizeUser::Engine, at: "a" }
