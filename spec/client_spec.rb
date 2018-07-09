require 'spec_helper'
require_relative '../lib/eia_fuel/client'

RSpec.describe EiaFuel::Client do
  describe "initialize" do
    after :all do
      EiaFuel.api_key = nil
    end

    it "fails if no api_key is present" do
      expect(EiaFuel::Client).to respond_to(:new)
      EiaFuel.api_key = nil
      expect { EiaFuel::Client.new }.to raise_error(EiaFuel::ApiKeyError)
    end

    it "succeeds if api_key is set" do
      expect(EiaFuel::Client).to respond_to(:new)
      EiaFuel.api_key = 'APIKeyIsPresent'
      expect { EiaFuel::Client.new }.to_not raise_error
    end

  end

  describe "#get" do
    before :all do
      @client = EiaFuel::Client.new(API_KEY)
    end
    after :all do
      EiaFuel.api_key = nil
    end

    context "when given a valid series_id" do
      it "returns data key with date, price pairs" do
        response = @client.get('PET.EMD_EPD2D_PTE_NUS_DPG.W')
        expect(response).to be_an_instance_of(EiaFuel::Series)
      end
    end

    context "when given an invalid series_id" do
      it "returns error data" do
        response = @client.get('gibberish')
        expect(response).to include({'data' => {'error' => a_string_matching(/invalid series_id/)}})
      end
    end
  end
end
