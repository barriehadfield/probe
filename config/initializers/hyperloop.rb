
Hyperloop.configuration do |config|
  # config.transport = :simple_poller
  config.transport = :none
  config.import 'opal_hot_reloader'
  config.import 'client_and_server'
end
