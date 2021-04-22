class ApplicationMailer < ActionMailer::Base
  default from: ENV['GMAIL']
  layout 'mailer'
end
