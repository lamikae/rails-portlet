# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  # protect_from_forgery # :secret => 'ea709d94c130ee67e28f8a3af55ccbe1'

  # Rails-portlet has session cookie support.
  #session :disabled => false

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  # Load the Caterpillar portlet development environment
  if RAILS_ENV=='development'
    before_filter :caterpillar
  end

  # Use the caterpillar layout
  layout 'caterpillar'

  # Caterpillar filter:
  #
  #  -  import configured portlets
  #  -  set default values for UID and GID
  def caterpillar # :nodoc:
    @caterpillar_navigation = Caterpillar::Navigation.rails
    @caterpillar_navigation_defaults = {
      :uid => 13904,
      :gid => 13912
    }
  end

end
