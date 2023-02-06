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

    statistic = Statistic.best_statistic_for(tier:, position:, role:)

    if statistic.present?
      @champ = Champion.where(key: statistic.champion_key).first
      @recommendation = Recommendation.create(
        champion_key: statistic.champion_key,
        win_rate: statistic.win_rate,
        pick_rate: statistic.pick_rate,
        tier: statistic.tier,
        position: statistic.position,
        role: statistic.role
      )

      if @recommendation.persisted?
        redirect_to recommendation_path(@recommendation)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def update
    recommendation = Recommendation.find(params[:id])

    feedback_score = params[:feedback_score].to_s == '' ? '1' : params[:feedback_score].to_s
    feedback_text = params[:feedback_text].to_s

    bad_request unless feedback_score.in?(['0', '1'])
    bad_request if feedback_text.length > 250

    recommendation.feedback_score = feedback_score.to_i
    recommendation.feedback_text = feedback_text

    recommendation.save

    redirect_to recommendation_path(recommendation)
  end
end
