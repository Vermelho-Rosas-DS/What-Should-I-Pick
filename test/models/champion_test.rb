require 'test_helper'

class ChampionTest < ActiveSupport::TestCase
  test 'Should return 2 on function return_2' do
    champion = Champion.new

    assert_equal 5, champion.retorna_2
  end
end
