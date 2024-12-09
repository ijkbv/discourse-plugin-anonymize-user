# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do
  resources :anonymize, constraints: StaffConstraint.new do
    get "/" => "anonymize#index"
    put "/:id/full" => "anonymize#full", :constraints => { id: /[%\w.\-]+?/ }
  end
end

Discourse::Application.routes.draw { mount ::DiscoursePluginAnonymizeUser::Engine, at: "anonymize-plugin" }
