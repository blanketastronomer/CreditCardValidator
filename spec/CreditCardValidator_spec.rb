require "spec_helper"

RSpec.describe CreditCardValidator do
  it "has a version number" do
    expect(CreditCardValidator::VERSION).not_to be nil
  end
end
