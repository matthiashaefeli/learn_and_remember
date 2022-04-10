# frozen_string_literal: true

class ReportMailer < ApplicationMailer
  def daily_report(report)
    @report = report

    mail(to: 'mat@matyou.net', subject: 'Daily Report')
  end
end
