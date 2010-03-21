class OtterController < ApplicationController

  def adorable
	if defined?(Lportal)
		@user  = User.find params[:uid]
		@group = Group.find params[:gid]
	end
  end

end
