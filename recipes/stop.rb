include_recipe "monit_config::service"

service "monit" do
  action :stop
end
