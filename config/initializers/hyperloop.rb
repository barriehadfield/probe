Hyperloop.configuration do |config|
  config.compress_system_assets = false
  config.prerendering = :off
  config.transport = :action_cable
  config.import 'opal_hot_reloader'
  config.import 'client_and_server'
  config.import 'statesman', gem: true
  # config.cancel_import('react/react-source-browser')
end
