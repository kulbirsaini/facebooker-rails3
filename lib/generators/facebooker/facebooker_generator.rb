require 'rails/generators'

class FacebookerGenerator < Rails::Generators::Base

  desc 'Facebooker configuration'

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def copy_files
    template 'config/facebooker.yml',            'config/facebooker.yml'
    template 'public/javascripts/facebooker.js', 'public/javascripts/facebooker.js'
  end
end
