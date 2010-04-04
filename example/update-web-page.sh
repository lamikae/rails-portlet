#!/usr/bin/env bash

	RAILS_ASSET_ID= RAILS_ENV=production ./script/server -p 3333 &
	sleep 5
	
	rm -rf tmp/web
	mkdir tmp/web && cd tmp/web
	wget "http://localhost:3333" -r -nH
	sed -i _ 's/localhost:3333/rails-portlet.rubyforge.org/g' *.html 
	sed -i _ 's/localhost:3333/rails-portlet.rubyforge.org/g' **/*.html
	rm -f **/*_ *_
	tree .
	sleep 2
	
	rsync * -r --delete lamikae@rubyforge.org:/var/www/gforge-projects/rails-portlet/

	echo "KILLING ALL RUBY PROCESSES.."
	killall ruby

