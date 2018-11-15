require 'httparty'
require 'openssl'
require 'date'

class BinanceApi
  include HTTParty

  URL = 'https://api.binance.com'.freeze
  DEFAULT_SYMBOL = 'ASTETH'.freeze

  base_uri(URL)

  attr_reader :options

  def initialize(options)
    @options = options
    self.class.headers('X-MBX-APIKEY' => ENV['BINANCE_API_KEY'])
  end

  def trades
    self.class.get('/api/v3/myTrades', signed_params(
      symbol: symbol,
      timestamp: synchronized_timestamp
    ))
  end

  def time
    self.class.get('/api/v1/time')
  end

  private

  def signed_params(params)
    signature = sign(HashConversions.to_params(params))

    { query: params.merge(signature: signature) }
  end

  def sign(query_string)
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), ENV['BINANCE_API_SECRET'], query_string)
  end

  def symbol
    options.fetch(:symbol, DEFAULT_SYMBOL)
  end

  def synchronized_timestamp
    timestamp + timestamp_diff
  end

  def timestamp
    DateTime.now.strftime('%Q').to_i
  end

  def timestamp_diff
    time['serverTime'].to_i - timestamp
  end
end
