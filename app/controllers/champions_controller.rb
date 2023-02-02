class ChampionsController < ApplicationController
  def index
    position = params[:position]
    tier = params[:tier] || 'all'
    @statistics = Statistic.filtered_by(tier:, position:).includes(:champion)
    @statistics = @statistics.sort_by { |statistic| statistic.champion.name_identifier }
  end

  def show
    @champion = Champion.find(params[:id])
  end
end
 