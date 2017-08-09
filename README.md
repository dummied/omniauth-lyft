omniauth-lyft
==============

Lyft OAuth2 Strategy for OmniAuth 1.x and supports the OAuth 2.0 server-side flow.

You may view the Lyft API documentation [here](https://developer.lyft.com/docs/authentication).

## Installation

Add to your `Gemfile`:

```ruby
gem 'omniauth-lyft'
```

Then `bundle install`.


## Usage

`OmniAuth::Strategies::Lyft` is simply Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :lyft, ENV['LYFT_CLIENT_ID'], ENV['LYFT_CLIENT_SECRET']
end
```

## Configuration

Currently, there is only one configuration option that needs to be set:

* `scope`: A comma-separated list of permissions you want to request from the user. The available permissions are as follows: `public`, `rides.read`, `offline`, `rides.request`, `profile`,  Default: `profile`

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :lyft, ENV['LYFT_CLIENT_ID'], ENV['LYFT_CLIENT_SECRET'], :scope => 'profile,rides.read'
end

```

## License

Copyright (c) 2017 by Chris Vannoy

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
