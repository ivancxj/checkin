#encoding: utf-8
class User < ActiveRecord::Base

  has_many :histories_today, -> { where("created_at > ? and created_at < ?", Time.now.beginning_of_day, Time.now.end_of_day) }, class_name: 'History', dependent: :destroy
  has_many :histories_yesterday, -> { where("created_at > ? and created_at < ?", (Time.now - 1.days).beginning_of_day, (Time.now - 1.days).end_of_day) }, class_name: 'History', dependent: :destroy

  #********全部字段
  # :mobile,     default: ''
  # :avatar,     default: ''
  # :name,       default: ''
  # :remark,     default: ''
  # :lng, comment: '经度', default: 0
  # :lat, comment: '纬度', default: 0
  #
  # :encrypted_password
  # :reset_password_token
  # :reset_password_sent_at
  # :last_login
  # :last_ip,     default: ''
  #
  # :client_v,      default: '', comment: '客户端版本'
  # :platform,      default: '', comment: 'ios/android'
  # :platform_v,    default: '', comment: '比如4.1.1'
  # :model,         default: '', comment: 'MI 2SC'
  # :imei,          default: ''
  # :resolution,    default: ''
  # :network,       default: ''
  # :channel,       default: '', comment: '下载市场'
  # :first_install, default: ''
  # :last_update,   default: ''
  # :operator,      default: '', comment: '移动联通还是电信, 比如ChinaMobile'

  validates_presence_of :name
  validates_uniqueness_of :name, message: '姓名重名了~'

  validates_presence_of :imei
  validates_uniqueness_of :imei, message: '手机已被注册'

end