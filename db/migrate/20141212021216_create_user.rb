class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string     :mobile,     default: ''
      t.string     :avatar,     default: ''
      t.string     :name,       default: ''
      t.string     :remark,     default: ''
      t.integer    :lng, comment: '经度', default: 0
      t.integer    :lat, comment: '纬度', default: 0

      t.string     :encrypted_password
      t.string     :reset_password_token
      t.datetime   :reset_password_sent_at
      t.datetime   :last_login
      t.string     :last_ip,     default: ''

      t.string     :client_v,      default: '', comment: '客户端版本'
      t.string     :platform,      default: '', comment: 'ios/android'
      t.string     :platform_v,    default: '', comment: '比如4.1.1'
      t.string     :model,         default: '', comment: 'MI 2SC'
      t.string     :imei,          default: ''
      t.string     :resolution,    default: ''
      t.string     :network,       default: ''
      t.string     :channel,       default: '', comment: '下载市场'
      t.string     :first_install, default: ''
      t.string     :last_update,   default: ''
      t.string     :operator,      default: '', comment: '移动联通还是电信, 比如ChinaMobile'

      t.timestamps
    end
  end
end
