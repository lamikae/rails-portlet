# encoding: utf-8
#--
# Copyright (c) 2010 Mikael Lammentausta
# This source code is available under the MIT license.
# See the file LICENSE.txt for details.
#++

require File.join(File.dirname(__FILE__),'..','spec_helper')
require 'tmpdir'

describe @caterpillar do

  def check_rails_gem(version)
    installed_rails_gems = %x[#{@ruby} `which gem` list rails]
    installed_rails_gems[/#{version}/].should == version #, "Ruby #{@ruby} does not come with Rails #{version}"
  end

  def create_rails(version)
    check_rails_gem(version)
    Dir.chdir(@tmpdir)
    system("#{@ruby} `which rails` _#{version}_ rails#{version} >/dev/null").should == true
    File.exist?("rails#{version}").should == true
    env = File.join(Dir.pwd, "rails#{version}", 'config', 'environment.rb')
    File.exist?(env).should == true
    _version = File.read(env)[/RAILS_GEM_VERSION.*$/][/([\d.]+)/,1]
    _version.should == version
    return File.join(Dir.pwd, "rails#{version}")
  end
  
  def package_caterpillar
    Dir.chdir File.join(@pwd,'..','caterpillar')
    version = File.read('lib/caterpillar.rb')[/VERSION.*/][/([\d.]+)/,1]
    system("#{@ruby} `which gem` build caterpillar.gemspec").should == true
    _gem = "caterpillar-#{version}.gem"
    File.exists?(_gem).should == true
    return _gem
  end

  def install_caterpillar
    gem = package_caterpillar
    system("sudo #{@ruby} `which gem` install #{gem} --no-ri --no-rdoc").should == true  
  end
  
  def pluginize_caterpillar(rails_version)
    STDOUT.puts 'Using ' + @ruby
    install_caterpillar
    rails_home = create_rails(rails_version)
    Dir.chdir rails_home
    system("#{@ruby} `which caterpillar` pluginize >/dev/null").should == true
    
    FileUtils.rm_rf rails_home
  end

  before(:each) do
    @pwd = Dir.pwd
    @tmpdir = Dir.tmpdir + '/rails-portlet'
    Dir.mkdir(@tmpdir) unless File.exists?(@tmpdir)
  end

  after(:each) do
    FileUtils.rm_rf @tmpdir
    Dir.chdir @pwd
  end
  
  it "pluginize caterpillar to Rails 2.1.2 with Ruby 1.8" do
    @ruby = '/usr/bin/ruby'
    pluginize_caterpillar('2.1.2')
  end

  it "pluginize caterpillar to Rails 2.1.2 with Ruby 1.9" do
    @ruby = `which ruby1.9`.strip
    pluginize_caterpillar('2.1.2')
  end

end
