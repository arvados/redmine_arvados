require 'arvados_hook_listener'
require 'application_helper_patch'

Redmine::Plugin.register :redmine_arvados do
  name 'Redmine Arvados plugin'
  author 'Ward Vandewege'
  description 'A plugin for the arvados.org site customizations'
  version '0.0.1'
  url 'https://github.com/arvados/redmine_arvados'
  author_url 'https://arvados.org'

  delete_menu_item :project_menu, :overview

 	# Attempt to add link to doc site in project menu. 
	# This does not work, cf. http://www.redmine.org/issues/11682. 
	# Ward, 2013-04-15
  #permission :arvados, { :arvados => [:index] }, :public => true
  menu :project_menu, :documentation, 'https://doc.arvados.org',
       :after => :repository, :caption => 'Documentation'

 	# As a workaround, add link to doc site in top menu. Ward, 2013-04-15
  menu :top_menu, :documentation, 'https://doc.arvados.org/',
       :caption => 'Documentation'
end

