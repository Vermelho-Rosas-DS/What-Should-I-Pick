class RecommendationsController < ApplicationController
  def show
    @recommendation = Recommendation.find(params[:id])
    not_found unless @recommendation.present?
    @champ = Champion.where(key: @recommendation.champion_key).first
    not_found unless @champ.present?

    @page_title = I18n.t('recommendations.show.page_title', recommendation_id: @recommendation.id)
  end

  def new
    @page_title = I18n.t('recommendations.new.page_title')
  end

  def create
    estats = Statistic.where(tier: params[:tier], position: params[:position], role: params[:role]).order(:win_rate).last
    if estats.present?
      champ_key = estats.champion_key
      @champ = Champion.where(key: champ_key).first
      @recommendation = Recommendation.create(champion_key: estats.champion_key, win_rate: estats.win_rate, pick_rate: estats.pick_rate)
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
