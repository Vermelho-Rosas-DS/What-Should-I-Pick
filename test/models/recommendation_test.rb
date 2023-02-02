require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase
  test 'Should attach a recommendation to a champion' do
    champion = champions(:aatrox)
    recommendation = Recommendation.create(champion_key: champion.key, win_rate: 0.5, pick_rate: 0.2)
    champion.reload

    assert_equal champion, recommendation.champion
    assert_equal [recommendation], champion.recommendations
  end
end
