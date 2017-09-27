require 'spec_helper'
require 'trip_sorter'
require 'boarding_cards'

describe TripSorter do
  describe '#sort_cards' do
    it 'should sort the cards when there is route' do
      cards = []
      cards << BoardingCards::TrainCard.new(origin: 'Madrid', destination: 'Barcelona',id: 'T1', seat: '1')
      cards << BoardingCards::TrainCard.new(origin: 'Girona', destination: 'Lleida',id: 'T2', seat: '1')
      cards << BoardingCards::TrainCard.new(origin: 'Barcelona', destination: 'Girona',id: 'T2', seat: '1')
      cards << BoardingCards::TrainCard.new(origin: 'Lleida', destination: 'Tarragona',id: 'T2', seat: '1')

      trip = TripSorter::TripSorter.new(cards)
      sorted = trip.send(:sort_cards)
      expect(sorted).to match_array([cards[0], cards[2], cards[1], cards[-1]])
    end

    it 'should raise exception when there is no route' do
      cards = []
      cards << BoardingCards::TrainCard.new(origin: 'Madrid', destination: 'Barcelona',id: 'T1', seat: '1')
      cards << BoardingCards::TrainCard.new(origin: 'Barcelona', destination: 'Girona',id: 'T2', seat: '1')
      cards << BoardingCards::TrainCard.new(origin: 'Lleida', destination: 'Tarragona',id: 'T2', seat: '1')

      trip = TripSorter::TripSorter.new(cards)
      expect {
        trip.send(:sort_cards)
      }.to raise_exception(TripSorter::NoRouteException)
    end

    it 'should raise exception when no final destination' do
      cards = []
      cards << BoardingCards::TrainCard.new(origin: 'Madrid', destination: 'Barcelona',id: 'T1', seat: '1')

      expect {
        trip = TripSorter::TripSorter.new(cards)
        trip.send(:sort_cards)
      }.to raise_exception(TripSorter::NotEnoughCardsException)
    end

  end

  describe '#to_s' do
    it 'should print every trip segment' do
      cards = []
      cards << BoardingCards::FlightCard.new(origin: 'Madrid', destination: 'Barcelona',id: 'T1', seat: '1', gate: 'G1', )
      cards << BoardingCards::BusCard.new(origin: 'Girona', destination: 'Lleida',id: 'B2', seat: '2')
      cards << BoardingCards::TrainCard.new(origin: 'Barcelona', destination: 'Girona',id: 'T2', seat: '3')
      cards << BoardingCards::TrainCard.new(origin: 'Lleida', destination: 'Tarragona',id: 'T2', seat: '4')

      trip = TripSorter::TripSorter.new(cards)
      desc = trip.to_s
      expect(desc).to match("#{cards[0]}\n#{cards[2]}\n#{cards[1]}\n#{cards[-1]}\n")
    end
  end

end