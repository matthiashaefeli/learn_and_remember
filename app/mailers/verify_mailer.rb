# frozen_string_literal: true

class VerifyMailer < ApplicationMailer
  def verify_email
    @user = params[:user]

    mail(to: @user.email, subject: 'Please Verify Your Email')
  end
end
