include_recipe "monit_config::service"

if platform?('debian','ubuntu')
  template "/etc/default/monit" do
    source "monit.erb"
    mode 0644
  end
end

service 'monit' do
  action :stop
end

template File.join(node[:monit][:conf_dir], "redis.monitrc") do
  source "redis.monitrc.erb"
  mode 0644
end

if platform?('centos','redhat','fedora','amazon')
  file File.join(node[:monit][:conf_dir], 'logging') do
    action :delete
  end
end

service 'monit' do
  action :restart
end
