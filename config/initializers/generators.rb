Rails.application.config.generators do |g|
  g.helper false
  g.assets false
  g.test_framework :rspec,
    fixtures: true,
    view_specs: false,
    helper_specs: false,
    controller_specs: true
end
