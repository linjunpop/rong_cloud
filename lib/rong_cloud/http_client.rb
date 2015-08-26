require 'net/http'
require 'json'
require 'ostruct'
require 'securerandom'

module RongCloud
  class HTTPClient
    DEFAULT_HOST = 'https://api.cn.rong.io'.freeze

    def initialize(host:DEFAULT_HOST, app_key:, app_secret:)
      @host = host
      @app_key = app_key
      @app_secret = app_secret
    end

    def request(method:, endpoint:'/', body:{}, headers:{})
      uri = URI.join(@host, endpoint)

      method = Object.const_get("Net::HTTP::#{method.capitalize}")
      request = method.new(uri)

      request.content_type = 'application/x-www-form-urlencoded'
      request.set_form_data(body)

      request.initialize_http_header({
        'App-Key' => @app_key,
        'Nonce' => sign[:nonce],
        'Timestamp' => sign[:timestamp].to_s,
        'Signature' => sign[:signature]
      })

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.port == 443)

      response = http.request(request)

      json = JSON.parse(response.body)

      case response
      when Net::HTTPSuccess then
        [true, json]
      else
        [false, json]
      end
    end

    private

    def sign
      @sign ||= -> {
        nonce = SecureRandom.hex
        timestamp = Time.now.to_i

        {
          nonce: nonce,
          timestamp: timestamp,
          signature: Digest::SHA1.hexdigest("#{@app_secret}#{nonce}#{timestamp}")
        }
      }.call
    end
  end
end
