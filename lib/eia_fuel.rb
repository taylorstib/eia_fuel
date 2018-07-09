# frozen_string_literal: true
require 'faraday'

# Version
require "eia_fuel/version"

# lib
require 'eia_fuel/client'
require 'eia_fuel/series'

module EiaFuel
  @base_url = 'http://api.eia.gov'
  @api_key = nil

  class << self
    attr_accessor :api_key, :base_url
  end

  class ApiKeyError < StandardError; end
end
