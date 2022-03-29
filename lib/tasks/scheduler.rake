# frozen_string_literal: true

desc 'This task is called by the Heroku scheduler add-on'
task one_month_reminder: :environment do
  puts 'Search Skills and send one month reminder emails'
  MonthRememberJob.perform_now
  puts 'done'
end

task five_month_reminder: :environment do
  puts 'Search Skills and send five month reminder emails'
  FiveMonthRememberJob.perform_now
  puts 'done'
end

task year_reminder: :environment do
  puts 'Search Skills and send yearly reminder emails'
  YearRememberJob.perform_now
  puts 'done'
end
