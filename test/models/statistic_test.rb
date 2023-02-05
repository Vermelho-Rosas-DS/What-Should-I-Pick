require 'test_helper'

class StatisticTest < ActiveSupport::TestCase
  test 'Should filter statistics correctly when using filtered_by method' do
    statistics = Statistic.filtered_by(tier: 'gold', position: 'top')
    statistics.each do |s|
      assert_equal 'gold', s.tier.to_s
      assert_equal 'top', s.position.to_s
    end

    statistics = Statistic.filtered_by(tier: 'gold', position: 'mid')
    statistics.each do |s|
      assert_equal 'gold', s.tier.to_s
      assert_equal 'mid', s.position.to_s
    end

    statistics = Statistic.filtered_by(tier: 'diamond', position: 'mid')
    statistics.each do |s|
      assert_equal 'diamond', s.tier.to_s
      assert_equal 'mid', s.position.to_s
    end

    expected_result = [statistics(:aatrox_mid_gold), statistics(:garen_mid_gold)].sort
    assert_equal expected_result, Statistic.filtered_by(tier: 'gold').to_a.sort
  end

  test 'should fetch most victorious statistic correctly' do
    Statistic.destroy_all

    aatrox = champions(:aatrox)
    garen = champions(:garen)

    statistic1 = Statistic.create({ tier: 'all', position: 'top', win_rate: 0.51, pick_rate: 0.01, role: 'fighter', champion: aatrox })
    statistic2 = Statistic.create({ tier: 'all', position: 'top', win_rate: 0.50, pick_rate: 0.02, role: 'marksman', champion: garen })
    statistic3 = Statistic.create({ tier: 'all', position: 'mid', win_rate: 0.49, pick_rate: 0.02, role: 'support', champion: aatrox })
    statistic4 = Statistic.create({ tier: 'all', position: 'mid', win_rate: 0.52, pick_rate: 0.03, role: 'tank', champion: garen })

    assert_equal statistic2, Statistic.most_victorious_statistic_for(tier: 'all', position: 'top', role: 'all', minimum_pick_rate: 0.015).first
    assert_equal statistic1, Statistic.most_victorious_statistic_for(tier: 'all', position: 'top', role: 'all').first
    assert_equal statistic3, Statistic.most_victorious_statistic_for(tier: 'all', position: 'all', role: 'support').first
    assert_equal statistic4, Statistic.most_victorious_statistic_for(tier: 'all', position: 'all', role: 'all', minimum_pick_rate: 0.02).first
    assert_equal statistic4, Statistic.most_victorious_statistic_for.first
  end
end
