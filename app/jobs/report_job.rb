# frozen_string_literal: true

class ReportJob < ApplicationJob
  def perform
    status_cero_skills = Skill.where(status: 0).count
    status_one_skills = Skill.where(status: 1).count
    status_two_skills = Skill.where(status: 2).count
    start_date = DateTime.now.beginning_of_day
    end_date = DateTime.now.end_of_day
    new_skills = Skill.where('skills.created_at BETWEEN ? AND ?', start_date, end_date).count
    users = User.count
    new_users = User.where('users.created_at BETWEEN ? AND ?', start_date, end_date).count
    report = {
      cero_skills: status_cero_skills,
      one_skills: status_one_skills,
      two_skills: status_two_skills,
      new: new_skills,
      users_total: users,
      users_new: new_users
    }
    ReportMailer.daily_report(report).deliver_later
  end
end
