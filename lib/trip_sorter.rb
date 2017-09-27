module TripSorter

  class NotEnoughCardsException < Exception; end
  class NoRouteException < Exception; end

  class TripSorter
    def initialize(cards)
      @cards = cards.dup
      if @cards.size < 2
        raise NotEnoughCardsException.new
      end
    end

    def journey
      @sorted_cards ||= sort_cards
    end

    def sort_cards
      first = origin
      sorted_cards = []
      sorted_cards << first
      sorted_by_origin = @cards.sort_by {|c| c.origin }

      last = sorted_cards.last
      while last != destination
        nxt = sorted_by_origin.bsearch do |c|
          last.destination <=> c.origin
        end
        if nxt
          sorted_cards << nxt
          last = nxt
        else
          raise NoRouteException.new("Could not find card with origin #{last.destination}")
        end
      end
      sorted_cards
    end

    def origin
      @cards[0]
    end

    def destination
      @cards[-1]
    end
  end

end