class Statistic < ApplicationRecord
    enum :tier, [:all,:iron,:bronze,:silver,:gold,:platinum,:diamond,:master,:gandmaster,:challenger]
    enum :position, [:top,:jungle,:mid,:,:adc,:support]
    enum :region, [:global,:na,:euw,:eune,:oce,:kr,:jp,:br,:las,:lan,:ru,:tr]
end
