class CreateHistory < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :user
      t.string     :last_ip,     default: ''
      t.string     :platform,      default: '', comment: 'ios/android'
      t.string     :platform_v,    default: '', comment: '比如4.1.1'
      t.string     :model,         default: '', comment: 'MI 2SC'
      t.string     :imei,          default: ''
      t.string     :resolution,    default: ''
      t.datetime   :created_at
    end
  end
end
