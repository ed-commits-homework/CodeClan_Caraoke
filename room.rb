class Room
    attr_accessor :guests, :capacity, :playlist

    def initialize(capacity, playlist)
        @guests = []
        @capacity = capacity
        @playlist = playlist
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
