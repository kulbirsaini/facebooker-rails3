module ::ActionDispatch
  class Request

    include Facebooker::Rails::BackwardsCompatibleParamChecks

    def xml_http_request_with_facebooker?
      one_or_true(parameters["fb_sig_is_mockajax"])  ||
      one_or_true(parameters["fb_sig_is_ajax"]) ||
      xml_http_request_without_facebooker?
    end
    alias_method_chain :xml_http_request?, :facebooker
    
    # we have to re-alias xhr? since it was pointing to the old method
    alias :xhr? :xml_http_request?

  end
end
