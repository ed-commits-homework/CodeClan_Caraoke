class Room
    attr_accessor :guests, :capacity, :playlist, :fee, :balance

    def initialize(capacity, playlist, fee = 12, balance = 0)
        @guests = []
        @capacity = capacity
        @playlist = playlist
        @fee = fee
        @balance = balance
    end

    def has_capacity
        @guests.length < @capacity
    end

    def check_in(guest)
        if has_capacity
            if guest.pay(@fee) == @fee
                @balance += @fee
                @guests << guest
            end
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
