# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----
require File.join(File.dirname(__FILE__), '../../..', 'puppet_x/icinga2/pbkdf2.rb')

# ---- original file header ----
#
# @summary
#   Summarise what the function does here
#
Puppet::Functions.create_function(:'icinga2::icinga2_ticket_id') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end


  def default_impl(*args)
    
    raise Puppet::ParseError, 'Must provide exactly two arguments to icinga2_ticket_id' if args.length != 2

    if !args[0] or args[0] == ''
      raise Puppet::ParseError, 'first argument (cn) can not be empty for icinga2_ticket_id'
    end
    if !args[1] or args[1] == ''
      raise Puppet::ParseError, 'second argument (salt) can not be empty for icinga2_ticket_id'
    end

    PBKDF2.new(
      :password => args[0],
      :salt => args[1],
      :iterations => 50000,
      :hash_function => OpenSSL::Digest.new("sha1")
    ).hex_string
  
  end
end
