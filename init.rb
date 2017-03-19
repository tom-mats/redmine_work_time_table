Redmine::Plugin.register :redmine_work_time_table do
  name 'Redmine Work Time Table plugin'
  author 'T. Matsushima'
  description 'Show spent time as table for suitable to Excel'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  menu :account_menu, :work_time_table, {:controller => 'work_time_table', :action => 'index'}, :caption => :work_time_table
end
