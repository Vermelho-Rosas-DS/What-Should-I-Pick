require 'test_helper'

class StatisticTest < ActiveSupport::TestCase
  # test 'Should filter statistics correctly when using filtered_by method' do
  #   statistics = Statistic.filtered_by(tier: 'gold', position: 'top')
  #   statistics.each do |s|
  #     assert_equal 'gold', s.tier.to_s
  #     assert_equal 'top', s.position.to_s
  #   end

  #   statistics = Statistic.filtered_by(tier: 'gold', position: 'mid', role: 'fighter')
  #   statistics.each do |s|
  #     assert_equal 'gold', s.tier.to_s
  #     assert_equal 'mid', s.position.to_s
  #   end

  #   statistics = Statistic.filtered_by(tier: 'diamond', position: 'mid', role: 'fighter')
  #   statistics.each do |s|
  #     assert_equal 'diamond', s.tier.to_s
  #     assert_equal 'mid', s.position.to_s
  #   end

  #   expected_result = [statistics(:aatrox_mid_gold), statistics(:garen_mid_gold)].sort
  #   assert_equal expected_result, Statistic.filtered_by(tier: 'gold').to_a.sort
  # end
end
