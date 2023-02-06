class Statistic < ApplicationRecord
  belongs_to :champion
  enum tier: { all: 0, iron: 1, bronze: 2, silver: 3, gold: 4, platinum: 5, diamond: 6, master: 7, grandmaster: 8, challenger: 9 },
       _prefix: true
  enum position: { top: 0, jungle: 1, mid: 2, adc: 3, support: 4 }, _prefix: true
  enum region: { global: 0, na: 1, euw: 2, eune: 3, oce: 4, kr: 5, jp: 6, br: 7, las: 8, lan: 9, ru: 10, tr: 11 }, _prefix: true

  validates :champion_id, uniqueness: { scope: [:tier, :position, :region] }

  scope :filtered_by, ->(tier:, position: nil) {
    if position.to_s == 'all' || position.nil?
      select('DISTINCT ON (champion_key) *').where(tier:).order(champion_key: :asc, pick_rate: :desc)
    else
      where(tier:, position:).order(:pick_rate)
    end
  }

  scope :most_victorious_statistic_for, ->(tier: 'all', position: 'all', role: 'all', minimum_pick_rate: 0.0, minimum_win_rate: 0.0) {
    query_params = {
      tier:
    }.with_indifferent_access
    query_params[:position] = position if position.to_s.in?(positions.keys)
    query_params[:role] = role if role.to_s != 'all' && !role.nil?

    where(query_params).where('pick_rate >= ? AND win_rate >= ?', minimum_pick_rate, minimum_win_rate).order(win_rate: :desc).limit(1)
  }

  def self.best_statistic_for(tier:, position:, role:)
    statistic = Statistic.most_victorious_statistic_for(tier:, position:, role:, minimum_pick_rate: Statistic.sporadic_pick_rate, minimum_win_rate: 0.5).first

    if statistic.blank?
      statistic = Statistic.most_victorious_statistic_for(tier:, position:, role:, minimum_pick_rate: Statistic.rare_pick_rate, minimum_win_rate: 0.5).first
    end

    statistic = Statistic.most_victorious_statistic_for(tier:, position:, role:).first if statistic.blank?

    statistic
  end

  def self.minimum_reliable_pick_rate
    sporadic_pick_rate
  end

  def self.sporadic_pick_rate
    0.012
  end

  def self.rare_pick_rate
    0.006
  end
end
