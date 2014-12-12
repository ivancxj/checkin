#encoding: utf-8
class History < ActiveRecord::Base
  belongs_to :user

  #********全部字段
  # :last_ip,     default: ''
  # :platform,      default: '', comment: 'ios/android'
  # :platform_v,    default: '', comment: '比如4.1.1'
  # :model,         default: '', comment: 'MI 2SC'
  # :imei,          default: ''
  # :resolution,    default: ''
  # :created_at

end