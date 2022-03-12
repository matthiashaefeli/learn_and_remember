# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "easyremindme@gmail.com"
  layout "mailer"
end
