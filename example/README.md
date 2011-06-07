This is an example Rails 2 application for Liferay deployment.

System equirements
==================

You need to have installed on the system:

*   Ruby 1.8.7 or 1.9
*   Rubygems
*   Git (to download example sources)
*   Ant (optional, for compiling dev version)

Liferay installation
--------------------

Please begin by installing Liferay 5 or 6. Download the latest Liferay Tomcat bundle from <a href="http://www.liferay.com/downloads/">liferay.com</a>. Unpack it to `/usr/local` and set proper privileges (adjust commands with your Liferay version):

      cd /usr/local
      unzip liferay-portal-tomcat-6.0.6-20110225.zip
      sudo chown -R `whoami` liferay-portal-6.0.6

If you are not familiar with Liferay, we will later get back to starting it up. By default it uses its own embedded datebase which is good for evaluation purposes.

Clone example application
-------------------------

Install the <em>Caterpillar</em> rubygem, along with Rails 2.3.11.

      gem install caterpillar
      gem install rails -v=2.3.11
      git clone git://github.com/lamikae/rails-portlet.git
      cd rails-portlet
      git submodule init
      git submodule update

Now everything is ready. The example application uses `caterpillar` plugin from git, via a symlink in `vendor/plugins`, but the `caterpillar` executable (installed by Rubygems) is used outside the Rails server.

Walk through configuration
--------------------------

Now the target is to have the portlet test bench to run inside Liferay. For this, Liferay needs to be configured through 3 XML files:

*   portlet-ext.xml
*   liferay-portlet-ext.xml
*   liferay-display.xml

Run the command

      caterpillar portlets

To check which routes are going to get "portletized". The output should include three portlets:

<pre>
Caterpillar: version 1.6.0  
 * Portlet configuration ***********************  
example  
        Hungry bear                   /bear/hungry  
        Adorable otters               /otters/adorable  
Caterpillar  
        Rails-portlet test bench      /caterpillar/test_bench
</pre>

Caterpillar is configured through `config/portlets.rb`, mainly, to set Liferay installation directory:

      portlet.container = Liferay
      portlet.container.root = '/usr/local/liferay-portal-6.0.6/tomcat-6.0.29'

And define the portlets:

      portlet.instances << {
        :name     => 'portlet_test_bench',
        :title    => 'Rails-portlet test bench',
        :category => 'Rails-portlet example'
      }


Deploy
------

On Liferay, you need to install the Rails-portlet jar file and the portlet XML configuration files.

If you specified a proper `portlet.container.root` directory in `config/portlets.rb`, Caterpillar will install the jar file for you. Run from within the `example` directory:

      caterpillar jar:install

The XML file `portlet-ext.xml` is not included in the Liferay bundle, so it can be freely installed. The other two Liferay-specific XML files are included, and Caterpillar reads them and appends its own configuration inside. In production environments you should be careful and backup `liferay-portlet-ext.xml` and `liferay-display.xml`. Run:

      caterpillar deploy:xml

If you just want to see the generated XML, run

      caterpillar makexml

Startup
-------

And you're ready to boot up Liferay.

      cd /usr/local/liferay-portal-6.0.6/tomcat-6.0.29
      bin/startup.sh && sleep 4 && tail -f logs/catalina.out


You should see lines like this in the output:

<pre>
Starting Liferay Portal Community Edition 6.0.6 CE (Bunyan / Build 6006 / February 17, 2011)
...
19:19:36,655 INFO  [Rails286Portlet:?] Initializing Rails-portlet portlet_test_bench (version 0.12.0)
...
INFO: Server startup in 46419 ms
</pre>

Start the example Rails application server.

      cd example
      ./script/server


Browse to <a href="http://localhost:8080/">http://localhost:8080/</a>. Login (click on "login as Bruno"), then add a new page and open it. On an empty page use the Liferay JavaScript controls to add a new application. You should see the 'Rails-portlet example' category. Open it and add the test bench.






