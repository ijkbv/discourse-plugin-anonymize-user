# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do
  scope path: nil, constraints: { format: %r{(json|html|\*/\*)} } do
    scope "/users", constraints: StaffConstraint.new do
      put "/:id" => "users#anonymize", :constraints => { id: RouteFormat.username }
    end
  end
end

Discourse::Application.routes.draw { mount ::DiscoursePluginAnonymizeUser::Engine, at: "anonymize" }
