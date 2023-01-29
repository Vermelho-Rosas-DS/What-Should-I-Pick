class Champion < ApplicationRecord
  has_many :statistics, dependent: :destroy
  attr_accessor :most_frequent_statistic

  def update_most_frequent_statistic
    @most_frequent_statistic = statistics.order(pick_rate: :desc).first..select('DISTINCT ON (campion_id) *')
  end
  validates :key, uniqueness: true
end
