# frozen_string_literal: true

module SkillHelper
  def fetch_skills(time)
    start_date = DateTime.now.beginning_of_day - time
    end_date = DateTime.now.end_of_day - time
    Skill.eager_load(user: :user_setting)
         .where(status: 1)
         .or(Skill.where(status: 2))
         .where('skills.created_at BETWEEN ? AND ?', start_date, end_date)
  end

  def fetch_skills_yearly()
    start_date = DateTime.now.beginning_of_day - time
    end_date = DateTime.now.end_of_day - time
    Skill.eager_load(user: :user_setting)
         .where(status: 1)
         .or(Skill.where(status: 2))
         .where('skills.created_at < ?', DateTime.now.beginning_of_day)
         .where("EXTRACT(month FROM skills.created_at) = EXTRACT(month FROM now())")
         .where("EXTRACT(day FROM skills.created_at) = EXTRACT(day FROM now())")
  end
end
