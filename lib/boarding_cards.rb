module BoardingCards

  class LuggageDrop
    def initialize(counter)
      @counter = counter
    end
  end

  class LuggageTransfer
  end

  class TransportCard
    attr_reader :origin, :destination
    def initialize(origin, destination, id)
      @origin = origin
      @destination = destination
      @id = id
    end

    def to_s
      "#{origin}-#{destination}"
    end
  end

  class TrainCard < TransportCard
    def initialize(origin:,destination:,id:,seat:)
      super(origin, destination, id)
      @seat = seat
    end
  end

  class AirportCard < TransportCard
    def initialize(origin:, destination:, id:, seat:, gate:, luggage:)
      super(origin, destination, id)
      @seat = seat
      @gate = gate
    end
  end

end
