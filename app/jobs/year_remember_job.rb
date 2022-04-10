# frozen_string_literal: true

class YearRememberJob < ApplicationJob
  include SkillHelper

  def perform
    skills = fetch_skills(1.year).where('user_settings.year = ?', true)
    skills.each do |skill|
      RememberMailer.month_remember_email(skill).deliver_now
    end
  end
end
