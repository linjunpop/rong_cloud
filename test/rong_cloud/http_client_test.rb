require 'test_helper'

class RongCloud::HTTPClientTest < Minitest::Test
  def test_send_a_request_with_invalid_app_key
    client = RongCloud::HTTPClient.new(
      app_key: 'uwd1c0sxdlx2',
      app_secret: 'Y1W2MeFwwwRxa0'
    )

    err = assert_raises RongCloud::Errors::Standard do
      client.request(
        method: 'post',
        endpoint: '/message/private/publish.json',
        body: {
          content: {content: 'foo'}.to_json,
          'fromUserId' => '123',
          'toUserId' => '333',
          'objectName' => 'RC:TxtMsg'
        }
      )
    end

    assert_equal 1002, err.error_code
    assert_equal "Invalidate App-Key.", err.error_message
  end
end
