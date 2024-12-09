# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do
  scope path: nil, constraints: { format: %r{(json|html|\*/\*)} } do
    namespace :users, constraints: StaffConstraint.new do
      put "/:id/anonymize" => "users#anonymize", :constraints => { id: /[%\w.\-]+?/ }
    end
  end
end

Discourse::Application.routes.draw { mount ::DiscoursePluginAnonymizeUser::Engine, at: "a" }
