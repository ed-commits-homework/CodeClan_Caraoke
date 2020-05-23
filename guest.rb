class Guest
    attr_reader :name, :money

    def initialize(name, money = 0)
        @name = name
        @money = money
    end

    def pay(fee)
        if @money >= fee
            @money -= fee
            return fee
        else
            return 0
        end
    end
end
