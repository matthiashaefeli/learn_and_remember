# frozen_string_literal: true

desc 'This task is called by the Heroku scheduler add-on'
task one_month_reminder: :environment do
  puts 'Search Skills and send one month reminder emails'
  MonthRememberJob.perform
  puts 'done'
end

task five_month_reminder: :environment do
  puts 'Search Skills and send five month reminder emails'
  FiveMonthRememberJob.perform
  puts 'done'
end

task year_reminder: :environment do
  puts 'Search Skills and send yearly reminder emails'
  YearRememberJob.perform
  puts 'done'
end
