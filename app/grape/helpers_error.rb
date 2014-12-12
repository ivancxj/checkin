#encoding: utf-8
module CheckinApi
  module HelpersError
    # 返回json格式
    # {code: code, msg: msg, errors:[{}],result:{}}
    # 如果code=0正常返回,结果集是result(可选)
    # 否则错误返回,错误信息是msg和errors的叠加
    def halt403(code, message = nil, ops = {})
      ops ||= {}
      message ||= _error code
      #Rails.logger.error "#{code}:#{message}:ops=#{ops}"
      error!({code: code, error: {errors: ops,msg: message}}, 200)
    end

    def ok_200
      error!({code: 0}, 200)
    end

    def _error(status)
      case status
        when 99; '自定义错误信息,需要被重定义'
        when 100; '用户注册失败~'
        when 101; '警告!!有异常,请及时联系管理员'

        else; '有错误'
      end
    end
  end

end