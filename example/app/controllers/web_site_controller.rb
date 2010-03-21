class WebSiteController < ApplicationController
  layout 'web'

  before_filter :get_navigation

  private

  def get_navigation
    @navigation=[
      { :label => 'Main page',
        :url   => 'index.html'
      },
      { :label => 'Guide',
        :url   => 'guide.html'
      },
      { :label => 'ChangeLog',
        :url   => 'http://rails-portlet.rubyforge.org/svn/trunk/Changelog.txt'
      },
      { :label => 'Example',
        :url   => 'example.html'
      },
      { :label => 'Development',
        :url   => 'development.html'
      },
#       { :label => 'Deployment',
#         :url   => 'deployment.html'
#       },
      { :label => 'Technical overview',
        :url   => 'overview.html'
      },
      { :label => 'Download',
        :url   => 'http://rubyforge.org/frs/?group_id=7064'
      }
    ]
  end

end
