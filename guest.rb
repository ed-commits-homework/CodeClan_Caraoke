class Guest
    attr_reader :name, :money, :favorite_song

    def initialize(name, money = 0)
        @name = name
        @money = money
        @favorite_song = "Bohemian Rhapsody"
    end

    def pay(fee)
        if @money >= fee
            @money -= fee
            return fee
        else
            return 0
        end
    end

    def cheer(song_name)
        return "Whoo!" if song_name == favorite_song
        return "..."
    end
end
