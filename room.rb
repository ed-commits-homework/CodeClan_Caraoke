class Room
    attr_accessor :guests, :capacity, :playlist, :fee

    def initialize(capacity, playlist, fee = 12)
        @guests = []
        @capacity = capacity
        @playlist = playlist
        @fee = fee
    end

    def has_capacity
        @guests.length < @capacity
    end

    def check_in(guest)
        if has_capacity && guest.pay(@fee) == @fee
            @guests << guest
        end
    end

    def check_out(guest)
        @guests.delete(guest)
    end

    def add_song(song)
        @playlist.pop()
        @playlist.unshift(song)
    end
end
