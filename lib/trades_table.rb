require 'terminal-table'

class TradesTable
  attr_reader :trades

  HEADINGS = %w(
    Symbol
    Price
    Quantity
    Comission
    Traded\ At
  ).freeze

  NO_TRADES = 'No trades were found for the given symbol in the requested period.'.freeze

  def initialize(trades)
    @trades = trades
  end

  def print
    puts trades.any? ? table : NO_TRADES
  end

  private

  def table
    Terminal::Table.new headings: HEADINGS, rows: rows
  end

  def rows
    trades.map { |trade| Row.new(trade).to_a }
  end

  class Row
    attr_reader :trade

    def initialize(trade)
      @trade = trade
    end

    %w(symbol price qty).each do |name|
      define_method(name) { trade[name] }
    end

    def comission
      "#{trade['commission']} #{trade['commissionAsset']}"
    end

    def time
      Time.strptime(trade['time'].to_s, '%Q').utc
    end

    def to_a
      [
        symbol,
        price,
        qty,
        comission,
        time
      ]
    end
  end
end
