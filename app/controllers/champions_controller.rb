class ChampionsController < ApplicationController
  def index
    @page_title = I18n.t('champions.index.page_title')

    field = params[:sort]&.split('-')&.first || 'name_identifier'
    sort_type = params[:sort]&.split('-')&.second || 'asc'

    @sort = { field => sort_type }
    @position = params[:position] || 'all'
    @tier = params[:tier] || 'all'
    @statistics = Rails.cache.fetch("champions#index/#{@tier}/#{@position}", expires_in: 12.hours) do
      Statistic.filtered_by(tier: @tier, position: @position).includes(:champion).to_a
    end

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

  def word_cloud
    @position = params[:position].presence || 'all'
  end

  def show
    @champ = Champion.find(params[:id])

    not_found if @champ.blank?

    @statistic = @champ.most_frequent_statistic
    @page_title = I18n.t('champions.show.page_title', champion_name: @champ.name)
  end
end
