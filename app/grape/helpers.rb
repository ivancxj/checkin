#encoding: utf-8
module CheckinApi
  module APIHelpers

    def format_time(time)
      time.strftime('%Y-%m-%d %H:%M:%S')
    end

    def auth!
      user_id = env['rack.session'][:user_id]
      error!({ error: '401 Unauthorized' }, 401) if user_id.nil?
    end

    def current_user_id
      user_id = env['rack.session'][:user_id]
      return nil if user_id.nil?
      user_id
    end

    def current_user
      user_id = env['rack.session'][:user_id]
      return nil if user_id.nil?
      @current_user ||= User.find(user_id)
    end


  end
end


