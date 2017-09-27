require 'spec_helper'
require 'boarding_cards'

describe BoardingCards do

  describe BoardingCards::LuggageDrop do
    describe '#to_s' do
      it 'should include counter info' do
        counter = 'counter 25'
        luggage = BoardingCards::LuggageDrop.new(counter)
        expect(luggage.to_s).to include(counter)
      end
    end
  end

  describe BoardingCards::LuggageTransfer do
    describe '#to_s' do
      it 'should include transfer info' do
        luggage = BoardingCards::LuggageTransfer.new()
        expect(luggage.to_s).to include(BoardingCards::LuggageTransfer::DESC)
      end
    end
  end

  describe BoardingCards::FlightCard do
    describe '#to_s' do
      it 'should include luggage info' do
        card = BoardingCards::FlightCard.new(origin: 'Madrid', destination: 'Barcelona',id: 'T1', seat: '1', gate: 'G1', luggage: BoardingCards::LuggageDrop.new('25'))
        expect(card.to_s).to include(card.luggage.to_s)
      end
    end
  end
end
