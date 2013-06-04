# Cookbook Name:: deployer
# Recipe:: default
# Copyright 2013, YOUR_COMPANY_NAME
# All rights reserved - Do Not Redistribute

u = data_bag_item('users', node[:deployer][:data_bag_id])

if u && u['id']
  group u['group'] || u['id']

  user u['id'] do
    shell "/bin/bash"
    group u['group'] || u['id']
    supports :manage_home => true
  end

  directory "#{(u['deployer'] && u['deployer']['deployment_root']) || node[:deployer][:deployment_root]}" do
    owner "root"
    group u['group'] || u['id']
    mode "0775"
  end

  if u['key']
    directory "/home/#{u['id']}/.ssh" do
      owner u['id']
      group u['group'] || u['id']
      mode 0700
      action :create
    end

    file "/home/#{u['id']}/.ssh/authorized_keys" do
      owner u['id']
      mode  0600
      content u['key']
      action :create_if_missing
    end
  end
end
