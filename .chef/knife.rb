# Chef-Zeroモードの場合にはtrueにする。Chef-Serverを利用する場合にはfalseにする
local_mode false

# Chef-Serverを利用する場合の設定
# See: https://docs.chef.io/workstation/getting_started/
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
client_key               "#{ENV['HOME']}/.chef/tsuyopon.pem"             # 鍵が配置されていること
node_name                'tsuyopon'                                      # ユーザー名
validation_client_name   'tsuyopon-validator'                            # 組織＋ -validator
validation_key           "#{current_dir}/tsuyopon-validator.pem"         # 組織名(このファイルは存在していない。。。本当に必要??)
chef_server_url          'https://api.chef.io/organizations/tsuyopon'    # サーバーのホスト名と、最後は組織名に変更する
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
#### Chef-Serverここまで

ssl_verify_mode        :verify_none

# 便利設定
chef_repo_dir = File.absolute_path( File.dirname(__FILE__) + "/.." )
node_path     "#{chef_repo_dir}/nodes"
role_path     "#{chef_repo_dir}/roles"

# data_bag設定
data_bag_path    "data_bags"
encrypted_data_bag_secret ".chef/data_bag_key"
