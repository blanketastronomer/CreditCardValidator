require "spec_helper"

RSpec.describe CreditCardValidator::IndustryIdentifier do
  let :identifier { CreditCardValidator::IndustryIdentifier }
  let :airline_number { rand(100000000000000..199999999999999) }

  describe "#industry" do
    it "matches the airline industry" do
      expect(identifier.industry(airline_number)).to eq("AIRLINES")
    end
  end
end
