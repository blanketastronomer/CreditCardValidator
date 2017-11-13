require "spec_helper"

RSpec.describe CreditCardValidator::IndustryIdentifier do
  let :identifier { CreditCardValidator::IndustryIdentifier }
  let :airline_number { rand(100000000000000..199999999999999) }
  let :airline_future_number { rand(200000000000000..299999999999999) }
  let :travel_entertainment_number { rand(300000000000000..399999999999999) }
  let :financial_number { rand(400000000000000..599999999999999) }
  let :merchandising_number { rand(600000000000000..699999999999999) }
  let :petroleum_number { rand(700000000000000..799999999999999) }
  let :healthcare_telecom_number { rand(800000000000000..899999999999999) }
  let :national_standards_number { rand(900000000000000..999999999999999) }

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

    it "matches the merchandising, banking, and financial industries" do
      expect(identifier.industry(merchandising_number)).to eq("MERCHANDISING/BANKING/FINANCIAL")
    end

    it "matches the petroleum and other future industries" do
      expect(identifier.industry(petroleum_number)).to eq("PETROLEUM/FUTURE")
    end

    it "matches the healthcare, telecom, and other future industries" do
      expect(identifier.industry(healthcare_telecom_number)).to eq("HEALTHCARE/TELECOM/FUTURE")
    end

    it "matches national standards bodies" do
      expect(identifier.industry(national_standards_number)).to eq("NATIONAL_STANDARDS_BODY")
    end
  end
end
