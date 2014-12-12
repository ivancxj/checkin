#encoding: utf-8
require 'helpers'
require 'helpers_encode'
require 'helpers_error'

require 'api_checkin'

module CheckinApi
  class API < Grape::API
    # 屏蔽不显示的原因是这里截获了错误日志,就无法显示和错误报警了!
    # rescue_from :all do |e|
    #   error_response({ message: "服务器正在泡妞,紧要关头不要烦他~ #{e.message}" })
    # end

    helpers APIHelpers
    helpers HelpersEncode
    helpers HelpersError
    format :json
    content_type :json, 'application/json'
    # 返回信息(response)压缩(50%-70%)
    use Rack::Deflater


    # todo 日志要写入内存 定时放入文件
    # logger.flush
    # Rails.logger.auto_flushing = 1
    # Rails.logger.info "bar"
    @@request_logger ||= Logger.new("#{Rails.root}/log/request.log")

    before do
      api_params = params.except(:route_info)
      # 中文上传会报错, 必须force_encoding('utf-8')
      # https://github.com/whitequark/rack-utf8_sanitizer
      api_params.each { |k, v| v.force_encoding(Encoding::UTF_8) if v.is_a?(String) }

      # @@request_logger.info "t=#{Time.now}_._._ip=#{env['action_dispatch.remote_ip'].to_s}_._._m=#{env['REQUEST_METHOD']}_._._path=#{env['REQUEST_PATH']}_._._params=#{api_params.to_json}_._._user_id=#{current_user_id}"

      # puts "t=#{Time.now}_._._ip=#{env['action_dispatch.remote_ip'].to_s}_._._m=#{env['REQUEST_METHOD']}_._._path=#{env['REQUEST_PATH']}_._._params=#{api_params.to_json}_._._user_id=#{current_user_id}"
    end

    mount CheckinApi::CheckinAPI

    # 从根开始截获全部不匹配的 url
    prefix '/'
    # 自定义 根url 返回信息
    get do
       {status: 0}
    end
    # 自定义404 必须要放最后
    route :any, '*path', :anchor => false do
      error!('404: Not Found', 404)
    end
  end
end
