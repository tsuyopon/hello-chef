#
# Cookbook:: hello-chef
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# 指定したファイルを作成する
file '/tmp/test.txt' do
  content "hello world.\n"
end

# template機能を使ってファイルを作成する。
# attributeで設定した値を指定しています。
#   Note: テスト用なので/tmp/ntp.confとしているが、本来は/etc/ntp.confでnotifiesのコメントを外す
template "/tmp/ntp.conf" do
  source "ntp.conf.erb"
#  notifies :restart, "service[ntpd]"
  action :create
  variables({
    :ntp_servers => node["test_cookbook"]["servers"]
  })  
end

# ntpをyumでインストールする
package "ntp" do
  action [ :install, :upgrade ]
end
