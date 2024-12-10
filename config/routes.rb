# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do
  namespace :anonymize do
    get "/" => "anonymize#index"
    get "/:id/anonymize" => "anonymize#getanonymize"
    put "/:id/anonymize" => "anonymize#anonymize"
  end
end

Discourse::Application.routes.draw { mount ::DiscoursePluginAnonymizeUser::Engine, at: "a" }
