# frozen_string_literal: true

class ReportJob < ApplicationJob
  def perform
    cero_skills_count = Skill.where(status: 0).count
    one_skills_count = Skill.where(status: 1).count
    two_skills_count = Skill.where(status: 2).count
    start_date = DateTime.now.beginning_of_day
    end_date = DateTime.now.end_of_day
    new_skills_count = Skill.where('skills.created_at BETWEEN ? AND ?', start_date, end_date).count
    users_count = User.count
    new_users_count = User.where('users.created_at BETWEEN ? AND ?', start_date, end_date).count
    report = {
      cero_skills: cero_skills_count,
      one_skills: one_skills_count,
      two_skills: two_skills_count,
      new_skills: new_skills_count,
      users_total: users_count,
      new_users: new_users_count
    }

    ReportMailer.daily_report(report).deliver_now
  end
end
