# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')

# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development

# cronを実行する環境変数をセット
set :environment, rails_env

# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

#定期実行したい処理を記入
job_type :rake, 'cd :path && export PATH=/usr/local/bin:$PATH &&
  :environment_variable=:environment bundle exec rake :task --silent :output'


# every 1.minute do
every 1.day, at: '21:00 pm' do  # 日本時間毎日朝6時に実行(システム上アメリカ時間になるため時間の表示はこのままでOK)
  rake 'expired_at_sendmail:mail_expiration_stock'
end