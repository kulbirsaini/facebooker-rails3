# Somewhere in 2.3 RewindableInput was removed- rack supports it natively
require 'rack/facebook'
require 'rack/facebook_session'

Rails::Application.middleware.insert_before( 
  ActionDispatch::ParamsParser,
  Rack::Facebook
)
# ActionController::Base::middleware_stack.insert(0, Rack::Facebook)

#use this if you aren't using the cookie store and want to use
# the facebook session key for your session id
# ActionController::Dispatcher.middleware.insert_before(
#   ActionController::Base.session_store,
#   Rack::FacebookSession,
#   ActionController::Base.session_options[:key]
# )
