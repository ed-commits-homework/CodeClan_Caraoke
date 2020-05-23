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
end
