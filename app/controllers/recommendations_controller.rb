class RecommendationsController < ApplicationController
  def show
    recommendation = Recommendation.find(params[:id])
    @recommendation = recommendation
    @champ = Champion.where(key: recommendation.champion_key).first
  end

  def new
  end

  def create
    estats = Statistic.where(tier: params[:tier], position: params[:position], role: params[:role]).order(:win_rate).last
    if estats.present?
      champ_key = estats.champion_key
      @champ = Champion.where(key: champ_key).first
      @recommendation = Recommendation.create(champion_key: estats.champion_key, win_rate: estats.win_rate, pick_rate: estats.pick_rate)
      if @recommendation.persisted?
        redirect_to recommendations_path(id: @recommendation.champion_key)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end
