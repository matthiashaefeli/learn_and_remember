# frozen_string_literal: true

class MonthRememberJob < ApplicationJob
  include SkillHelper

  def perform
    skills = fetch_skills(1.month).where('user_settings.first_month = ?', true)
    skills.each do |skill|
      RememberMailer.month_remember_email(skill).deliver_now
    end
  end
end
