class RecommendationsController < ApplicationController
  def show
    @recommendation = Recommendation.find(params[:id])
    not_found if @recommendation.blank?
    @champ = Champion.where(key: @recommendation.champion_key).first
    not_found if @champ.blank?

    @page_title = I18n.t('recommendations.show.page_title', recommendation_id: @recommendation.id)
  end

  def new
    @page_title = I18n.t('recommendations.new.page_title')
  end

  def create
    tier = params[:tier]
    position = params[:position]
    role = params[:role]

    statistic = Statistic.most_victorious_statistic_for(tier:, position:, role:, minimum_pick_rate: Statistic.minimum_reliable_pick_rate).first

    if statistic.present?
      champ_key = statistic.champion_key
      @champ = Champion.where(key: champ_key).first
      @recommendation = Recommendation.create(champion_key: statistic.champion_key, win_rate: statistic.win_rate, pick_rate: statistic.pick_rate)
      if @recommendation.persisted?
        redirect_to recommendation_path(@recommendation)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end
