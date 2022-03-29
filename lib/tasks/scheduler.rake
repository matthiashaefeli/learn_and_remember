desc "This task is called by the Heroku scheduler add-on"
task :one_month_reminder => :environment do
  puts "Search Skills and send emails"
  MonthRememberJob.perform
  puts "done."
end

task :five_month_reminder => :environment do
  puts "Search Skills and send emails"
  FiveMonthRememberJob.perform
  puts "done."
end

task :year_reminder => :environment do
  puts "Search Skills and send emails"
  YearRememberJob.perform
  puts "done."
end