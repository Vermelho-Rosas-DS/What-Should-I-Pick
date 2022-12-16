class Champion < ApplicationRecord
  has_many :statistics, dependent: :nullify
  attr_accessor most_frequent_statistic:
    
    def most_frequent_statistic()
        most_frequent_statistic: = self.statistics.order(:pick_rate :desc).first
    end
end
