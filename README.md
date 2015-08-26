# RongCloud

Unofficial RongCloud API wrapper.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rong_cloud'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rong_cloud

## Usage

### Sample

```ruby
client = RongCloud::HTTPClient.new(
  app_key: 'uwd1c0sxdlx2',
  app_secret: 'Y1W2MeFwwwRxa0'
)

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
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rong_cloud.

