# **discourse-plugin-anonymize-user**

**Plugin Summary**

This plugin is created, because the default `/admin/users/<userId>/anonymize` endpoint of Discourse does not provide the option to supply the `:anonymize_ip` parameter.
Therefore this plugin can be used to fully anonymize your user including the IP address. Call `/ijk/users/<userId>/anonymize` (PUT) to reach this endpoint.
