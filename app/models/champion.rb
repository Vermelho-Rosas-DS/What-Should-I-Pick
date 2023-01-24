class Champion < ApplicationRecord
  has_many :statistics, dependent: :destroy
  attr_accessor :most_frequent_statistic

  def update_most_frequent_statistic
    @most_frequent_statistic = statistics.order(pick_rate: :desc).first
  end

  validates :key, uniqueness: true

  %i[title blurb lore enemy_tips ally_tips].each do |field|
    define_method field.to_s do
      if I18n.locale == :en
        attributes[field.to_s]
      else
        attributes["#{field}_#{I18n.locale.to_s.downcase.sub('-', '_')}"]
      end
    end
  end
end
