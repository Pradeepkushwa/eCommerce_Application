# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :bundle_command, 'bundle exec'
job_type :runner,  "cd :path && :bundle_command rails runner -e :environment ':task' :output"
set :environment, "development"
# set :output, "/path/to/my/cron_log.log"
set :output, "log/cron.log"
#
every 1.minutes do
  # command "/usr/bin/some_great_command"
  runner "User.user_message"
  # rake "some:great:rake:task"
end

# every 2.minutes do
#     runner "UserMailer.user_confirmation(User.last).deliver_now"
# end

# every 1.day, at: '3:05 pm' do
#     runner "UserMailer.user_confirmation(User.last).deliver_now"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
