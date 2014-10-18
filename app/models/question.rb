class Question < ActiveRecord::Base
  belongs_to :exam

  enum question_type: [:choices, :essay]
end
