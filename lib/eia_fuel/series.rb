require 'date'

module EiaFuel
  class Series
    attr_reader :series_id
    attr_reader :name
    attr_reader :units
    attr_reader :frequency
    attr_reader :unitsshort
    attr_reader :description
    attr_reader :copyright
    attr_reader :source
    attr_reader :iso3166
    attr_reader :geography
    attr_reader :start
    attr_reader :end
    attr_reader :updated
    attr_reader :data

    def initialize(series = nil)
      if series
        [:series_id, :name, :units, :frequency, :unitsshort, :description, :copyright, :source, :iso3166, :geography].each do |var|
          self.instance_variable_set "@#{var}", series[var.to_s]
        end
        @start   = Date.strptime(series["end"], "%Y%m%d")
        @end     = Date.strptime(series["end"], "%Y%m%d")
        @updated = Date.parse(series["updated"])
        @data    = generate_data(series["data"])
      end
    end

    def latest_price
      data.first.price
    end

    private

    def generate_data(data_array)
      data_array.map do |tuple|
        Tuple.new(Date.strptime(tuple.first, "%Y%m%d"), tuple.last)
      end
    end
  end
  Tuple = Struct.new(:date, :price)
end
