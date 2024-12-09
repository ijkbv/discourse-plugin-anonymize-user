# frozen_string_literal: true

# name: discourse-plugin-anonymize-user
# about: Anonymize user including ip address
# version: 1.0.0
# authors: IJK Development
# url: https://github.com/ijkbv/discourse-plugin-anonymize-user
# required_version: 2.7.0

enabled_site_setting :discourse_plugin_anonymize_user_enabled

module ::DiscoursePluginAnonymizeUser
  PLUGIN_NAME = "discourse-plugin-anonymize-user"
end

require_relative "lib/discourse_plugin_anonymize_user/engine"

after_initialize do
  # Code which should run after Rails has finished booting
end
