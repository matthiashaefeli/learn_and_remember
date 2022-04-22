# frozen_string_literal: true

class FiveMonthRememberJob < ApplicationJob
  include SkillHelper

  def perform
    skills = fetch_skills(5.months).where('user_settings.five_month = ?', true)
    skills.each do |skill|
      RememberMailer.five_month_remember_email(skill).deliver_now
    end
  end
end
