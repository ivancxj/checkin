# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => Setting.email.server,
    :port => Setting.email.port,
    :domain => Setting.email.domain,
    :authentication => Setting.email.authentication,
    :user_name => Setting.email.sender,
    :password => Setting.email.password
    #:tls => true,
    #:enable_starttls_auto => true
}
