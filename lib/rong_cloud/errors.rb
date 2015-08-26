module RongCloud
  class Errors
    Base = Class.new(StandardError)

    class Standard < Base
      attr_reader :error_code, :error_message

      DOC_URI = "http://www.rongcloud.cn/docs/server.html#API_方法返回值说明".freeze

      def initialize(error_code:, error_message:)
        @error_code = error_code
        @error_message = error_message
      end

      def message
        <<-EOS
        Code: #{@code}
        Message: #{@message}
        Please read the doc: #{DOC_URI}
        EOS
      end
    end
  end
end
