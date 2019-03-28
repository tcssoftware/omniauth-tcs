# Omniauth::Tcs

TCS OAuth2 strategy for OmniAuth 1.x and supports the OAuth 2.0 server-side flow.
 
## Installation

Add this line to your application's Gemfile:

```ruby
gem "omniauth-tcs", git: "https://github.com/tcssoftware/omniauth-tcs"
```

And then execute:

    $ bundle install

## Usage

OmniAuth::Strategies::Tcs is simply a Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/omniauth/omniauth.

Here's a quick example, adding the middleware to a Rails app in config/initializers/omniauth.rb:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tcs, ENV['TCS_CLIENT_ID'], ENV['TCS_CLIENT_SECRET']
end
```

## Configuration

Currently, there is only one configuration option that needs to be set:

* `scope`: A comma-separated list of permissions you want to request from the user. The currently available permissions are `public` and `write`.  

As new services are added the scopes will be updated.  Default: `public`

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tcs, ENV['TCS_CLIENT_ID'], ENV['TCS_CLIENT_SECRET'], :scope => 'user_info,events'
end
```

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  "provider":"tcs",
  "uid":190544,
  "info": {
     "first_name":       "Test",
     "last_name":        "Tester",
     "prefix":           "",
     "suffix":           "",
     "nickname":         "Testy",
     "address_type":     "Company",
     "address1":         "425 Metro place",
     "address2":         "",
     "city":             "Dublin",
     "state":            "OH",
     "zip":              "43017",
     "country":          "",
     "phone":            "614-451-5010",
     "fax":              "",
     "mobile":           "",
     "date_joined":      "",
     "exp_date":         "",
     "category":         "Corporate",
     "sub_category1":    "",
     "email_address":    "Testy@TCSSoftware.com",
     "contact_no":       1001,
     "id":               190544,
     "org_id":           "RSA",
     "org_name":         "TCS Software, Inc.",
     "key_contact":      false,
     "fp_timestamp":     1553725241,
     "fingerprint":      "b0ccb4b685217114bfec7876675dcc73",
  },
  "credentials": {
     "token":           "ee61cbe8e9f22badd0cbd3f03e505af62404dc79ac0828d76579e39c9b407fcb",
     "refresh_token":   "5860560f6d4392b600de39714a056716e2f9fc05285ee3635cf67f630a10f09c",
     "expires_at":      1553732440,
     "expires":         true
  },
  "extra": {
  }
}

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tcssoftware/omniauth-tcs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::Tcs project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/omniauth-tcs/blob/master/CODE_OF_CONDUCT.md).
