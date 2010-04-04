class WebSiteController < ApplicationController
  layout 'web'

  before_filter :get_navigation

  private

  def get_navigation
    @navigation=[
      { :label => 'intro',
        :url   => '/index.html'
      },
      { :label => 'features',
        :url   => doc_url(:action => 'features')
      },
      { :label => 'setup guide',
        :url   => doc_url(:action => 'defaultsetup')
      },
      #{ :label => 'portlet development guide',
      #  :url   => doc_url(:action => 'development')
      #},
      { :label => 'source',
        :url   => 'http://github.com/lamikae/rails-portlet'
      },
    ]
  end

end
