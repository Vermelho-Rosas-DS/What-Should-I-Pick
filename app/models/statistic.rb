class Statistic < ApplicationRecord
  belongs_to :champion
  enum :tier, [:all, :iron, :bronze, :silver, :gold, :platinum, :diamond, :master, :grandmaster, :challenger]
  enum :position, [:top, :jungle, :mid, :adc, :support]
  enum :region, [:global, :na, :euw, :eune, :oce, :kr, :jp, :br, :las, :lan, :ru, :tr]
end
