# frozen_string_literal: true

class YearRememberJob < ApplicationJob
  include SkillHelper

  def perform
    skills = fetch_skills_yearly().where('user_settings.year = ?', true)
    skills.each do |skill|
      RememberMailer.yearly_remember_email(skill).deliver_now
    end
  end
end
