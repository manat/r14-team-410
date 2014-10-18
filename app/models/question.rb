class Question < ActiveRecord::Base
  belongs_to :exam

  enum question_type: [:choices, :essay]

	validates :exam, presence: true
  validates :title, presence: true
	validates :question_type, presence: true
end
