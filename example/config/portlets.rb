# encoding: utf-8
Caterpillar::Config.new do |portlet|

  # The portlet container.
  # By default only portlet.xml is created.
  # Currently only Liferay is supported. You may optionally define the version.
  portlet.container = Liferay
  # portlet.container.version = '6.0.6'

  # If you want to install the Rails-portlet JAR into the container, the container
  # WEB-INF will be used.
  #
  # Since liferay-display-ext.xml does not exist, all portlets are categorized in
  # liferay-display.xml. Caterpillar parses this file and appends Rails portlets.
  #
  # No changes are made to any of the files in this directory while making XML,
  # only the deploy and install tasks make any changes.
  portlet.container.root = '/usr/local/liferay-portal-6.0.6/tomcat-6.0.29'

  # The server that the container is running on.
  # Possible values:
  #  - 'Tomcat' (default)
  #  - 'JBoss/Tomcat'
  # portlet.container.server = 'JBoss/Tomcat'

  # The server dir is only meaningful with JBoss, and is ignored with Tomcat.
  # This should be set to the tree starting from container.root set above,
  # and the top level should contain the WEB-INF directory.
  # portlet.container.server_dir = 'server/default/deploy/ROOT.war'

  # Deploy directory for the WAR file.
  # Please use absolute path.
  # Not needed for Tomcat unless you have a complex setup.
  # portlet.container.deploy_dir = '/opt/myDeployDir'

  # JRUBY_HOME can be set here, unless the environment variable can be used.
  # portlet.class::JRUBY_HOME = '/usr/local/jruby'

  # The hostname and port.
  # By default the values are taken from the request.
  portlet.host = 'http://localhost:3000'
 
  # If the Rails is running inside a servlet container such as Tomcat,
  # you can define the servlet here.
  # By default the servlet is the name of the Rails app.
  # Without Warbler this should be an empty string.
  portlet.servlet = 'example-portlet'
 
  # Portlet category. This is only available for Liferay.
  # By default this is the same as the servlet.
  portlet.category = 'Rails-portlet example'

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
  #  - :name                     -- named route
  #  - :category                 -- portlet category (Liferay only)
  #  - :title                    -- the title in portlet container's category (Liferay only)
  #  - :edit_mode                -- enables edit mode for the portlet, adds <portlet-mode>edit</portlet-mode> 
  #                                 to portlet-ext.xml. Default value is false
  #  - :instanceable             -- enables instanceable for the portlet, add <instanceable>true</instanceable> to
  #                                 liferay-portlet-ext.xml. Default value is false
  #  - :preferences_route        -- To customize the preferences route for the portlet
  #  - :public_render_parameters -- enables public render parameters. The variables should not have the sufix '_prp', 
  #                                 they have to be the same as requested by portlets.
  #                                 Ex: portlets.instances << {
  #                                       :name => 'portlet_name',
  #                                       :public_render_parameters => [:tag, :param2, :param3]
  #                                     }
  #  - :javascripts              -- portlet-specific javascripts that are included at
  #                                 the head of master HTML, such as body onload functions (Liferay only)
  #  - :host                     -- hostname:port of the deployment server
  #  - :servlet                  -- by default, the name of the Rails app (= name of the WAR package)
  #  - :path                     -- unless you're using named routes, you can define the path here

  # Rails-portlet testing application.
  # NOTE: this needs to be activated by 'map.caterpillar' in RAILS_ROOT/config/routes.rb
  portlet.instances << {
    :name     => 'portlet_test_bench',
    :title    => 'Rails-portlet test bench',
    :category => 'Rails-portlet example'
  }
  # include example actions through named routes
  portlet.instances << {:name => 'hungry_bear'}
  portlet.instances << {:name => 'adorable_otters'}
  
  # This secret string is shared between the portlets and the Rails server,
  # and passed in a cookie with every request.
  # It is used to prevent spoofed requests from unauthorized clients.
  portlet.session_secret = {
    :key    => '_rails_portlet',
    :secret => 'cfb08929b6465bced2081c3387940d07bf7dceac8e38c95ea34bd1e518ca3bce7244aafedcefc10b6d8c79b37a0b88f501f237361e45360ff688cad332222ccb'
  }

  # this will include all named routes without further configuration
  portlet.include_all_named_routes = false

end
