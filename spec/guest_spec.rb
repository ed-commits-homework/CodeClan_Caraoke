require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")

class TestGuest < MiniTest::Test
    def test_guest_name
        ed = Guest.new("Ed")
        assert_equal("Ed", ed.name)
    end
end
