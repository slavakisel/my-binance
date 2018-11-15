require 'dotenv'
require 'optparse'

require_relative 'lib/binance_api'
require_relative 'lib/trades_table'

Dotenv.load

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: trades.rb [options]"

  opts.on("-s NAME", "--symbol NAME", "[Optional] Trade pair (default ASTETH)") do |v,k|
    options[:symbol] = v
  end

  puts opts
  puts "\n"
end.parse!

response = BinanceApi.new(options).trades

if response.success?
  TradesTable.new(response).print
else
  puts "Binance API responded with error: #{response['msg']}"
end
