class Champion < ApplicationRecord
    has_many :statistics
    attr_accessor :pick_rate
    
    def prencherpick()
        statistics.pick_rate = self.statistics.order(pick_rate: :desc).first
end
