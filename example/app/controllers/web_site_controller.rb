class WebSiteController < ApplicationController
  layout 'web'

  before_filter :get_navigation

  private

  def get_navigation
    @navigation=[
      { :label => 'intro',
        :url   => doc_url(:action => 'index')
      },
      { :label => 'setup guide',
        :url   => doc_url(:action => 'defaultsetup')
      },
      { :label => 'details',
        :url   => doc_url(:action => 'features')
      },
      #{ :label => 'portlet development guide',
      #  :url   => doc_url(:action => 'development')
      #},
      { :label => 'source code',
        :url   => 'http://github.com/lamikae/rails-portlet'
      },
    ]
  end

end
