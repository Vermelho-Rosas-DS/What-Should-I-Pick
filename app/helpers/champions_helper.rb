module ChampionsHelper
  def render_pick_rate_badge(pick_rate)
    if pick_rate >= 15.0
      color = 'blue-500'
      label = I18n.t('statistic.label.pickrate.fever')
    elsif pick_rate >= 12.0
      color = 'indigo-500'
      label = I18n.t('statistic.label.pickrate.super_popular')
    elsif pick_rate >= 9.0
      color = 'teal-500'
      label = I18n.t('statistic.label.pickrate.popular')
    elsif pick_rate >= 6
      color = 'green-600'
      label = I18n.t('statistic.label.pickrate.frequent')
    elsif pick_rate >= 2.75
      color = 'yellow-600'
      label = I18n.t('statistic.label.pickrate.common')
    elsif pick_rate >= 1.2
      color = 'orange-600'
      label = I18n.t('statistic.label.pickrate.sporadic')
    elsif pick_rate >= 0.8
      color = 'red-500'
      label = I18n.t('statistic.label.pickrate.forgotten')
    elsif pick_rate >= 0.6
      color = 'red-600'
      label = I18n.t('statistic.label.pickrate.rare')
    elsif pick_rate >= 0.35
      color = 'red-800'
      label = I18n.t('statistic.label.pickrate.very_rare')
    else
      color = 'purple-500'
      label = I18n.t('statistic.label.pickrate.odd')
    end

    content_tag(:span, label, class: "badge bg-#{color}")
  end

  def render_win_rate_badge(win_rate)
    if win_rate >= 54.0
      color = 'blue-500'
      label = I18n.t('statistic.label.winrate.legendary')
    elsif win_rate >= 52.5
      color = 'indigo-500'
      label = I18n.t('statistic.label.winrate.outstanding')
    elsif win_rate >= 51.5
      color = 'teal-500'
      label = I18n.t('statistic.label.winrate.very_good')
    elsif win_rate >= 50.5
      color = 'green-500'
      label = I18n.t('statistic.label.winrate.good')
    elsif win_rate >= 49.5
      color = 'yellow-600'
      label = I18n.t('statistic.label.winrate.ok')
    elsif win_rate >= 47.0
      color = 'orange-600'
      label = I18n.t('statistic.label.winrate.below_average')
    elsif win_rate >= 40.0
      color = 'red-600'
      label = I18n.t('statistic.label.winrate.poor')
    elsif win_rate >= 30.0
      color = 'red-700'
      label = I18n.t('statistic.label.winrate.terrible')
    else
      color = 'red-800'
      label = I18n.t('statistic.label.winrate.garbage')
    end

    content_tag(:span, label, class: "badge bg-#{color}")
  end
end
