# frozen_string_literal: true

class ReportMailer < ApplicationMailer
  def daily_report(report)
    @report = report

    mail(to: 'easyremindme@gmail.com', subject: 'Daily Report')
  end
end
