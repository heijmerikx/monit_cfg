include_recipe "monit_cfg::service"

service "monit" do
  action :stop
end
