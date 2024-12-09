# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do
  scope "users" do
    put "/:id/anonymize" => "users#anonymize", :constraints => { id: /[%\w.\-]+?/ }
  end
end

Discourse::Application.routes.draw { mount ::DiscoursePluginAnonymizeUser::Engine, at: "a" }
