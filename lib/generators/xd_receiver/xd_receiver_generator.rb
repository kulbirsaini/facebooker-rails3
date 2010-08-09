require 'rails/generators'

class XdReceiverGenerator < Rails::Generators::Base
  desc 'Generates cross domain receiver pages.'

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def copy_files
    template "xd_receiver.html",     "public/xd_receiver.html"
    template "xd_receiver_ssl.html", "public/xd_receiver_ssl.html"
  end
end
