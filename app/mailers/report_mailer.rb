#encoding: utf-8
class ReportMailer < ActionMailer::Base
  default from: Setting.email.sender
  default :charset => 'utf-8'
  default :content_type => 'text/html'

  def notify(message,url)

    @url = url
    mail to: %w(peij@163.com xinjun.chen@lrlz.com), subject: '熊猫美妆签到报表'
  end

end