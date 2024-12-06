# frozen_string_literal: true
require_dependency "anonymize_user_constraint"

DiscoursePluginAnonymizeUser::Engine.routes.draw do
  scope "anonymize" do
    get "/" => "anonymize#index"
    put "/full" => "anonymize#anonymizefull"
  end
end

Discourse::Application.routes.draw { mount ::DiscoursePluginAnonymizeUser::Engine, at: "my-plugin" }

# Discourse::Application.routes.draw do
#   scope path: nil, constraints: { format: %r{(json|html|\*/\*)} } do
#     namespace :admin, constraints: StaffConstraint.new do
#       resources :users, id: RouteFormat.username, only: %i[index destroy] do
#         put "anonymizefull"
#       end
#     end
#   end
# end
