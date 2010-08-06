module Facebooker
  class Railtie < Rails::Railtie
    initializer 'facebooker.load_confirguration' do |app|
      facebook_config = "#{Rails.root}/config/facebooker.yml"
      FACEBOOKER = Facebooker.load_configuration(facebook_config)
    end
    
    initializer 'facebooker.require_rails_libraries' do |app|
      module Facebooker::Rails; end
      require 'net/http_multipart_post'
      if defined? Rails
        require 'facebooker/rails/helpers/stream_publish'
        require 'facebooker/rails/helpers/fb_connect'
        require 'facebooker/rails/helpers'
        require 'facebooker/rails/backwards_compatible_param_checks'
        require 'facebooker/rails/controller'
        require 'facebooker/rails/facebook_url_rewriting'
        require 'facebooker/rails/facebook_request_fix_2-3'
        require 'facebooker/rails/routing'
        require 'facebooker/rails/facebook_pretty_errors' rescue nil
        require 'facebooker/rails/facebook_url_helper'
        require 'facebooker/rails/extensions/rack_setup'
        require 'facebooker/rails/extensions/action_controller'
        #require 'facebooker/rails/extensions/action_view'
        require 'facebooker/rails/extensions/routing'
      end
    end
    
    initializer 'facebooker.set_logger' do |app|
      # enable logger before including everything else, in case we ever want to log initialization
      Facebooker.logger = RAILS_DEFAULT_LOGGER if Object.const_defined? :RAILS_DEFAULT_LOGGER
    end
  end
end
