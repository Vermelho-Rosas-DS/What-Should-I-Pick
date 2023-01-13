class RecommendationsController < ApplicationController
  def show
    @champ = Champion.find(params[:id]).name
  end

  def new
  end

  def create
    stats = Statistic.where(tier: params[:tier], position: params[:position], role: params[:role]).order(:win_rate).last
    Rails.logger.debug stats.class
    stats = stats.champion_key
    @champ = Champion.where(key: stats).first
    redirect_to recommendations_path(id: @champ.id)
  end
end
