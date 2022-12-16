class Champion < ApplicationRecord
    has_many :statistics
    attr_accessor mostfrequentattribute:
    
    def mostfrequentattribute()
        statistics.mostfrequentattribute = self.statistics.order(:pick_rate, :tier, :position, :win_rate, :performance, :kill, :death, :assist, :champion_key :desc)
    end
end
