require "spec_helper"

RSpec.describe CreditCardValidator::IndustryIdentifier do
  let :identifier { CreditCardValidator::IndustryIdentifier }
  let :airline_number { rand(100000000000000..199999999999999) }
  let :airline_future_number { rand(200000000000000..299999999999999) }

  describe "#industry" do
    it "matches the airline industry" do
      expect(identifier.industry(airline_number)).to eq("AIRLINES")
    end

    it "matches the airline, financial, and other future industries" do
      expect(identifier.industry(airline_future_number)).to eq("AIRLINES/FINANCIAL/FUTURE")
    end
  end
end
