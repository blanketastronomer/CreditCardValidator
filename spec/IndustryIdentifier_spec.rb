require "spec_helper"

RSpec.describe CreditCardValidator::IndustryIdentifier do
  let :identifier { CreditCardValidator::IndustryIdentifier }
  let :airline_number { rand(100000000000000..199999999999999) }
  let :airline_future_number { rand(200000000000000..299999999999999) }
  let :travel_entertainment_number { rand(300000000000000..399999999999999) }
  let :financial_number { rand(400000000000000..599999999999999) }

  describe "#industry" do
    it "matches the airline industry" do
      expect(identifier.industry(airline_number)).to eq("AIRLINES")
    end

    it "matches the airline, financial, and other future industries" do
      expect(identifier.industry(airline_future_number)).to eq("AIRLINES/FINANCIAL/FUTURE")
    end

    it "matches the travel and entertainment industries" do
      expect(identifier.industry(travel_entertainment_number)).to eq("TRAVEL/ENTERTAINMENT")
    end

    it "matches the banking and financial industries" do
      expect(identifier.industry(financial_number)).to eq("BANKING/FINANCIAL")
    end
  end
end
