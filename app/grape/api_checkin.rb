#encoding: utf-8
module CheckinApi
  class CheckinAPI < Grape::API
    version 'v1'

    resource :users do
      desc '注册'
      params do
        requires :name, desc: '注册'
        requires :imei
        # optional :platform
        # optional :platform_v
        optional :model
        # optional :resolution
      end
      get :login do

        user = User.where(name: params[:name]).first
        if user.present?
          halt403 101 if user.imei != params[:imei]
        else
          begin
            User.transaction do
              opt = {name: params[:name], imei: params[:imei]}
              opt[:model] = params[:model]

              user = User.new(opt)
              user.save!
            end
          rescue
            #Rails.logger.error "error:#{$!} at:#{$@}"
            halt403(100, _error(100), user.errors.messages)
          end

        end

        env['rack.session'][:user_id] = user.id

        Jbuilder.encode do |json|
          json.name user.name
        end

      end # 注册


      desc '签到'
      params do
        requires :imei
        # optional :platform
        # optional :platform_v
        # optional :model
        # optional :resolution
      end
      get :checkin do
        auth!

        user = User.where(id: current_user_id).first
        if user.present?
          halt403 101 if user.imei != params[:imei]

          history = History.new
          history.user_id = current_user_id
          history.save

          Jbuilder.encode do |json|
            t = history.created_at
            # 9点 - 10点 算迟到
            if t.hour == 9 and t.min > 0
              json.later true
              json.msg "Check in later for #{t.min} minutes"
            else
              json.later false
              json.msg "Check in Success at #{t.strftime('%H:%M:%S')}"
            end
          end

        else
          error!({error: '401 Unauthorized'}, 401)
        end

      end # 签到

      desc '邮件发送'
      get :mail do

        # User
        url = 'http://www.baidu.com'
        ReportMailer.notify('熊猫美妆签到报表', url).deliver
        ok_200
      end


    end
  end
end



