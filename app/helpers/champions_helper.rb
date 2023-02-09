module ChampionsHelper
  def render_ai_tips(ai_tips)
    ai_tips.split("\n").map do |line|
      content_tag(:p, line)
    end.join('').html_safe
  end
end
