class Question < ActiveRecord::Base
  belongs_to :exam

  enum question_type: [:choices, :essay]

	validates :exam, presence: true
  validates :title, presence: true
	validates :question_type, presence: true
	validates :choice1, presence: true
	validates :choice2, presence: true
	validates :choice3, presence: true
	validates :choice4, presence: true
	validates :solution, presence: true
end
