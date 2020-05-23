class Room
    attr_accessor :guests, :capacity

    def initialize(capacity)
        @guests = []
        @capacity = capacity
    end

    def check_in(guest)
        if @guests.length < @capacity
            @guests << guest
        end
    end

    def check_out(guest)
        @guests.delete(guest)
    end
end
