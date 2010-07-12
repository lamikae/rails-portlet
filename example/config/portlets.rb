Caterpillar::Config.new do |portlet|

  # JRUBY_HOME can be set here, unless the environment variable can be used.
  # portlet.class::JRUBY_HOME = '/usr/local/jruby'

  # The portlet container.
  # By default only portlet.xml is created.
  # Currently only Liferay is supported. You may optionally define the version.
  portlet.container = Liferay
  portlet.container.version = '5.2.3'
  #portlet.container.version = '6.0.1'

  # If you want to install the Rails-portlet JAR into the container, the container
  # WEB-INF will be used.
  #
  # Since liferay-display-ext.xml does not exist, all portlets are categorized in
  # liferay-display.xml. Caterpillar parses this file and appends Rails portlets.
  #
  # No changes are made to any of the files in this directory while making XML,
  # only the deploy and install tasks make any changes.
#  portlet.container.root = '/usr/local/liferay-portal-6.0.1/tomcat-6.0.26'

  # The server that the container is running on.
  # Possible values:
  #  - 'Tomcat' (default)
  #  - 'JBoss/Tomcat'
  # portlet.container.server = 'JBoss/Tomcat'

  # The server dir is only meaningful with JBoss.
  # This is the name of the directory in server/.
  # By default the first entry in the directory is chosen.
  # portlet.container.server_dir = 'default'

  # Allow to defining the deploy_dir - both the WAR file and the XML files
  # are deployed under this directory.
  # portlet.container.deploy_dir = '/opt/myDeployDir'

  # The hostname and port.
  # By default the values are taken from the request.
  portlet.host = 'http://localhost:3000'
 
  # If the Rails is running inside a servlet container such as Tomcat,
  # you can define the servlet here.
  # By default the servlet is the name of the Rails app.
  # Without Warbler this should be an empty string.
  portlet.servlet = ''
 
  # Portlet category. This is only available for Liferay.
  # By default this is the same as the servlet.
  # portlet.category = 'Example Rails app'

  # Portlet instances.
  #
  # Each named route is mapped to a portlet.
  #
  # All keys except for 'name' are obligatory. If the name does not map to a route,
  # you have to define the route here.
  # You may override the host, servlet and category here.
  # Most likely you will want to let ActionController::Routing to set the route.
  #
  # Available keys are:
  #  - :name        -- named route
  #  - :category    -- portlet category (Liferay only)
  #  - :title       -- the title in portlet container's category (Liferay only)
  #  - :javascripts -- portlet-specific javascripts that are included at
  #                    the head of master HTML, such as body onload functions (Liferay only)
  #  - :host        -- hostname:port of the deployment server
  #  - :servlet     -- by default, the name of the Rails app (= name of the WAR package)
  #  - :path        -- unless you're using named routes, you can define the path here

  # Rails-portlet testing application.
  # NOTE: this needs to be activated by 'map.caterpillar' in RAILS_ROOT/config/routes.rb
  portlet.instances += [
    {
      :name     => 'portlet_test_bench',
      :title    => 'Rails-portlet test bench',
      :category => 'Caterpillar'
    },
    {
      :name => 'hungry_bear',
      :category => 'Caterpillar'
    }
  ]
  

  # this will include all named routes without further configuration
  portlet.include_all_named_routes = false

end
