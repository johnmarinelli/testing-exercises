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

# every hour o fevery day every week
every '0 * * * *' do 
#  runner "SignupMailer.signup_mail(User.first).deliver", :environment => "production"
end

every '* * * * *' do
#  runner "QueryRunner.send_emails", :environment => "production"
end
