# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do
  resources :users, constraints: StaffConstraint.new do
    get "/" => "users#index"
    put "/:id/anonymize" => "users#anonymize", :constraints => { id: /[%\w.\-]+?/ }
  end
end

Discourse::Application.routes.draw { mount ::DiscoursePluginAnonymizeUser::Engine, at: "anonymize-plugin" }
