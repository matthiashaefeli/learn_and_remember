# frozen_string_literal: true

class RememberMailer < ApplicationMailer
  def month_remember_email(skill)
    @skill = skill
    @user = @skill.user

    mail(to: @user.email, subject: 'Easy Remember Me: 1 Month ago')
  end

  def five_month_remember_email(skill)
    @skill = skill
    @user = @skill.user

    mail(to: @user.email, subject: 'Easy Remember Me: 5 Months ago')
  end

  def yearly_remember_email(skill)
    @skill = skill
    @user = @skill.user

    mail(to: @user.email, subject: "Easy Remember Me: #{@year_number} Years ago")
  end
end
