class Champion < ApplicationRecord
    has_many :statistics
    attr_accessor :pick_rate, tier:, position:, win_rate:, performance:, kill:, death:, assist:, champion_key:
    
    def mostfrequentattribute()
        statistics = self.statistics.order(:pick_rate, :tier, :position, :win_rate, :performance, :kill, :death, :assist, :champion_key :desc).first
    end
end
