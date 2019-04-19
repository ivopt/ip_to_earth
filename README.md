
<p align="center">
  <img src="https://app.expeditedaddons.com/iptoearth.png"/>
  
</p>

<h1 align='center'>IP to Earth</h1>

## Find the Country and City of origin for an IP Address

## Requirements

- An API Key from Heroku
    - Add from: https://elements.heroku.com/addons/iptoearth

- Ruby v2.x or greater

## Usage

### Input Parameter Descriptions

| Index       | Name    | Example | Description |
| --------------- | ------- | -------- |--------|
|0|`ip`|string|IPv4 or IPv6 address|



### Making a Request

```ruby
require "ip_to_earth"

IpToEarth.lookup('68.10.149.45') # Pass in any valid IPv4 or IPv6 value
```

### Using Results

```ruby
result = IpToEarth.lookup("8.8.8.8")
# => #<struct IpToEarth::APIResult
#  valid=true,
#  country="United States",
#  country_code="US",
#  hostname="",
#  city="Mountain View",
#  ip="8.8.8.8",
#  latitude=37.40599060058594,
#  longitude=-122.0785140991211,
#  region="California",
#  continent_code="NA",
#  country_code3="USA",
#  currency_code="USD">

result.valid # => true 
result.country # => "United States" 
result.country_code # => "US" 
result.city # => "Virginia Beach" 
result.latitude # => 37.40599060058594 
# ...
```


## Installation

```ruby
# In your Gemfile
gem 'ip_to_earth', git: 'https://github.com/LynxEyes/ip_to_earth.git'
```    


## Result Attribute Descriptions

| Attribute       | Type    | Description |
| --------------- | ------- | -------- |
|`valid`|boolean|If the IP Address passed in is syntactically valid|
|`country`|string|Full country name where the IP address is located|
|`country_code`|string|ISO Country Code for the IP Address|
|`hostname`|string|Hostname - if any - for the IP address|
|`city`|string|City where the IP Address is located|
|`ip`|string|IP address that was evaluated|
|`latitude`|float|Geographic latitude of the identified IP address|
|`longitude`|float|Geographic longitude of the identified IP address|
|`region`|string|State or Region where the IP address is located|


## Live Interactive Testing

Doublecheck results, use a Live Proxy and check your API Key with the interactive documentation at:

http://docs.iptoearthexp.apiary.io/

You will need your `IPTOEARTH_API_KEY` from the setup screen where you've provisioned the IP to Earth add-on.

## Troubleshooting

As a sanity check it is sometimes useful to bypass your app stack and check the endpoint, your API Key and parameters directly.

*Test with your browser*

```
# Modify the following to use your actual API Key
'https://iptoearth.expeditedaddons.com/?api_key=REPLACE_WITH_YOUR_IPTOEARTH_API_KEY&ip=68.10.149.45'
```

A successful call will return your requested data with a HTTP result code of `200` and be in `JSON` format. We recommend the [JSON Formatter](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en) extension as a useful tool. 

## In Development

The IP to Earth gem relies upon the environment variable `ENV['IPTOEARTH_API_KEY']` being present and correctly configured to authenticate to the service. You will need to have this variable present in your local environment for the gem to work correctly.

If you're using Heroku, please read their [Guide to Heroku Local](https://devcenter.heroku.com/articles/heroku-local) which has instructions on easily copying your config values to your development environment.

**DOTENV**

[https://github.com/bkeepers/dotenv](https://github.com/bkeepers/dotenv)

If you're trying to use IP to Earth in your local development or test environment with the [dotenv](https://github.com/bkeepers/dotenv) gem be sure that you are loading the `dotenv-rails` gem with the `rails-now` requirement. 

```ruby
# Example Gemfile excerpt

gem 'dotenv-rails', :require => 'dotenv/rails-now'
gem 'iptoearth'
```

**FOREMAN**

[https://github.com/ddollar/foreman](https://github.com/ddollar/foreman)

If you're having issues with configuring `dotenv`, you might want to try [foreman](https://github.com/ddollar/foreman) which will also autoload `.env` files in your local environment.


**Test in the Rails console**

Launch `rails c` in your development project directory and at the prompt enter `ENV[IPTOEARTH_API_KEY]` which, if you've configured your development environment correctly should display your API Key.

## License

The IP to Earth gem is licensed under the MIT license.

