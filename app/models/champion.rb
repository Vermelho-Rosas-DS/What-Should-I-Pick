class Champion < ApplicationRecord
    has_many :statistics
    attr_accessor :pick_rate
    def prencherpick()
        Champion.statistics.pick_rate() = self.statistics.order(pick_rate: :desc).first
        end
end
