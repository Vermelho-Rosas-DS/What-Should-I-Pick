module StatisticsHelper
  def available_tiers
    Statistic.tiers.keys
  end

  def available_positions
    Statistic.positions.keys + ['all']
  end

  def translated_tier(tier)
    I18n.t("tiers.#{tier}.name")
  end

  def translated_position(position)
    I18n.t("lanes.#{position}.name")
  end

  def pick_rate_label_and_color(pick_rate)
    if pick_rate >= 15.0
      color = 'blue-500'
      label = 'fever'
    elsif pick_rate >= 12.0
      color = 'indigo-500'
      label = 'super_popular'
    elsif pick_rate >= 9.0
      color = 'teal-500'
      label = 'popular'
    elsif pick_rate >= 6
      color = 'green-600'
      label = 'frequent'
    elsif pick_rate >= 2.75
      color = 'yellow-600'
      label = 'common'
    elsif pick_rate >= 1.2
      color = 'orange-600'
      label = 'sporadic'
    elsif pick_rate >= 0.8
      color = 'red-500'
      label = 'forgotten'
    elsif pick_rate >= 0.6
      color = 'red-600'
      label = 'rare'
    elsif pick_rate >= 0.35
      color = 'red-800'
      label = 'very_rare'
    else
      color = 'purple-500'
      label = 'odd'
    end

    {
      label: label,
      color: color
    }.with_indifferent_access
  end

  def render_pick_rate_badge(pick_rate)
    badge_data = pick_rate_label_and_color(pick_rate)
    content_tag(:span, I18n.t("statistic.label.pickrate.#{badge_data[:label]}"), class: "badge bg-#{badge_data[:color]}")
  end

  def win_rate_label_and_color(win_rate)
    if win_rate >= 54.0
      color = 'blue-500'
      label = 'legendary'
    elsif win_rate >= 52.5
      color = 'indigo-500'
      label = 'outstanding'
    elsif win_rate >= 51.5
      color = 'teal-500'
      label = 'very_good'
    elsif win_rate >= 50.5
      color = 'green-500'
      label = 'good'
    elsif win_rate >= 49.5
      color = 'yellow-600'
      label = 'ok'
    elsif win_rate >= 47.0
      color = 'orange-600'
      label = 'below_average'
    elsif win_rate >= 40.0
      color = 'red-600'
      label = 'poor'
    elsif win_rate >= 30.0
      color = 'red-700'
      label = 'terrible'
    else
      color = 'red-800'
      label = 'garbage'
    end

    {
      label: label,
      color: color
    }.with_indifferent_access
  end

  def render_win_rate_badge(win_rate)
    badge_data = win_rate_label_and_color(win_rate)
    content_tag(:span, I18n.t("statistic.label.winrate.#{badge_data[:label]}"), class: "badge bg-#{badge_data[:color]}")
  end
end
