require 'test_helper'

class RongCloud::HTTPClientTest < Minitest::Test
  def test_send_a_request_with_invalid_app_key
    client = RongCloud::HTTPClient.new(
      app_key: 'uwd1c0sxdlx2',
      app_secret: 'Y1W2MeFwwwRxa0'
    )

    success, json = client.request(
      method: 'post',
      endpoint: '/message/private/publish.json',
      body: {
        content: {content: 'foo'}.to_json,
        'fromUserId' => '123',
        'toUserId' => '333',
        'objectName' => 'RC:TxtMsg'
      }
    )

    assert_equal(false, success)
    assert_equal(1002, json['code'])
    assert_equal('Invalidate App-Key.', json['errorMessage'])
  end
end
