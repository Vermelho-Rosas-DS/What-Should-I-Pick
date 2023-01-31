class Recommendation < ApplicationRecord
  belongs_to :champion, inverse_of: :recommendations, foreign_key: :champion_key, primary_key: :key, class_name: 'Champion'
  enum feedback_score: { is_negative: 0, is_positive: 1 }, _prefix: true
end
