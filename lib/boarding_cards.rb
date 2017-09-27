module BoardingCards

  class LuggageDrop
    def initialize(counter)
      @counter = counter
    end
  end

  class LuggageTransfer
    def to_s

    end
  end

  class TransportCard
    attr_reader :origin, :destination, :id, :seat

    def initialize(origin, destination, id, seat)
      @origin = origin
      @destination = destination
      @id = id
      @seat = seat
    end

    def seat_desc
      if @seat
        "Seat #{@seat}"
      else
        'No seat assignement'
      end
    end
    def to_s
      "#{origin}-#{destination}"
    end
  end

  class TrainCard < TransportCard
    def initialize(origin:,destination:,id:,seat: nil)
      super(origin, destination, id, seat)
      @seat = seat
    end

    def to_s
      "Take train #{id} from #{origin} to #{destination}. #{seat_desc}."
    end
  end

  class BusCard < TransportCard
    def initialize(origin:,destination:,id:,seat: nil)
      super(origin, destination, id, seat)
      @seat = seat
    end

    def to_s
      "Take #{id} bus from #{origin} to #{destination}. #{seat_desc}."
    end
  end

  class FlightCard < TransportCard
    attr_reader :gate

    def initialize(origin:, destination:, id:, seat:, gate:, luggage: nil)
      super(origin, destination, id, seat)
      @seat = seat
      @gate = gate
    end

    def to_s
      "From #{origin} take flight #{id} to #{destination}. Gate #{gate}, #{seat_desc}"
    end
  end

end
