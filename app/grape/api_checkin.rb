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
        # optional :model
        # optional :resolution
      end
      post :login do

        user = User.where(name: params[:name]).first
        if user.present?
          halt403 101 if user.imei != params[:imei]
        else
          begin
            User.transaction do
              user = User.new(name: params[:name], imei: params[:imei])
              user.save!
              env['rack.session'][:user_id] = user.id
            end
          rescue
            #Rails.logger.error "error:#{$!} at:#{$@}"
            halt403(100, _error(100), user.errors.messages)
          end

        end

        Jbuilder.encode do |json|
          json.user do
            json.name user.name
          end
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

        history = History.new
        history.user_id = current_user_id
        history.save


        Jbuilder.encode do |json|
          json.history do
            json.created_at format_time history.created_at
            json.success true
          end
        end



      end # 签到


    end
  end
end



