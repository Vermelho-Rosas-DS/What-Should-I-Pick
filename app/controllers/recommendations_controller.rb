class RecommendationsController < ApplicationController
  def show
    @champ = Champion.find(params[:id]).name
  end

  def new
  end

  def create
    estats = Statistic.where(tier: params[:tier], position: params[:position], role: params[:role]).order(:win_rate).last
    estats = estats.champion_key
    @champ = Champion.where(key: estats).first
    redirect_to recommendations_path(id: @champ.id)
    @recommendation = Recommendation.create(champion_key: params[:champion_key],win_rate: params[:win_rate],pick_rate: params[:pick_rate])
  end
end
