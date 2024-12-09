# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do
  resources :users, constraints: StaffConstraint.new do
    get "/test" => "users#index"
    get "/:id/getanonymize" => "users#getanonymize", :constraints => { id: /[\w.\-\+\%\&]+/i }
    get "/:id/getanonymize2" => "users#getanonymize2"
    put "/:id/anonymize" => "users#anonymize", :constraints => { id: /[\w.\-\+\%\&]+/i }
  end
end

Discourse::Application.routes.append { mount ::DiscoursePluginAnonymizeUser::Engine, at: "anonymize-plugin" }
