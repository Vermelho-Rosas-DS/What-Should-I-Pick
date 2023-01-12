class Recommendation < ApplicationRecord
    enum feedback_score: { is_negative: 0, is_positive: 1 }, _prefix: true
end
