require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")

class TestGuest < MiniTest::Test
    def test_guest_name
        ed = Guest.new("Ed")
        assert_equal("Ed", ed.name)
    end

    def test_guest_pay_fee
        ed = Guest.new("Ed", 50)
        assert_equal(ed.money, 50)
        assert_equal(10, ed.pay(10))
        assert_equal(ed.money, 40)
    end
    
    def test_guest_cant_pay_fee
        ed = Guest.new("Ed", 10)
        assert_equal(ed.money, 10)
        assert_equal(0, ed.pay(50))
        assert_equal(ed.money, 10)
    end

    def test_guest_cheer
        ed = Guest.new("Ed", 10)
        assert_equal("Whoo!", ed.cheer("Bohemian Rhapsody"))
    end

    def test_guest_cheer_not_favorite
        ed = Guest.new("Ed", 10)
        assert_equal("...", ed.cheer("Sweet Caroline"))
    end
end
