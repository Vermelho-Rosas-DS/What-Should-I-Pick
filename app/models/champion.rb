class Champion < ApplicationRecord
  has_many :statistics, dependent: :destroy
  attr_accessor :most_frequent_statistic

  def update_most_frequent_statistic
    @most_frequent_statistic = statistics.order(pick_rate: :desc).first
  end
  validates :key, uniqueness: true
end
