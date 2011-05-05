# -*- ruby -*-

require 'rubygems'
require 'hoe'

# Hoe.plugin :compiler
# Hoe.plugin :gem_prelude_sucks
# Hoe.plugin :inline
# Hoe.plugin :racc
# Hoe.plugin :rubyforge

Hoe.spec 'send_csv' do
  developer('Ouvrages', 'contact@ouvrages-web.fr')
end

# http://blog.behindlogic.com/2008/10/auto-generate-your-manifest-and-gemspec.html
task :cultivate do
  system "touch Manifest.txt; rake check_manifest | grep -v \"(in \" | patch"
  system "rake debug_gem | grep -v \"(in \" > `basename \\`pwd\\``.gemspec"
end

# vim: syntax=ruby
