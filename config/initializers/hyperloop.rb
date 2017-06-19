
Hyperloop.configuration do |config|
  # config.transport = :simple_poller
  config.transport = :action_cable
  config.import 'opal_hot_reloader'
  config.import 'client_and_server'
  # config.cancel_import('react/react-source-browser')
end
