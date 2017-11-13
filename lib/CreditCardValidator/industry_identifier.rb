module CreditCardValidator
  class IndustryIdentifier
    def self.industry(card_number)
      iin = card_number.to_s.split('').first.to_i

      case iin
        when 1
          return 'AIRLINES'
        when 2
          return "AIRLINES/FINANCIAL/FUTURE"
        when 3
          return "TRAVEL/ENTERTAINMENT"
      end
    end
  end
end
