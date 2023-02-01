class ChampionsController < ApplicationController
  def index
    @page_title = I18n.t('champions.index.page_title')

    field = params[:sort]&.split('-')&.first || 'name_identifier'
    sort_type = params[:sort]&.split('-')&.second || 'asc'

    @sort = { field => sort_type }
    @position = params[:position] || 'all'
    @tier = params[:tier] || 'all'

    ## TODO - botar um cache aqui utilizando o tier e a position na chave do cache
    ## Inicio do Cache
    @statistics = Statistic.filtered_by(tier: @tier, position: @position).includes(:champion)
    ## Fim do cache

    case field
    when 'name_identifier'
      @statistics = @statistics.sort_by { |statistic| statistic.champion.name_identifier }
    when 'win_rate'
      @statistics = @statistics.sort_by(&:win_rate)
    when 'pick_rate'
      @statistics = @statistics.sort_by(&:pick_rate)
    end
    @statistics.reverse! if sort_type != 'asc'
  end

  def show
    @champion = Champion.find(params[:id])
    not_found if @champion.blank?

    @page_title = I18n.t('champions.show.page_title', champion_name: @champion.name)
  end
end
