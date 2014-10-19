class Exam < ActiveRecord::Base
	belongs_to :user
	has_many :questions

	validates :name, presence: true
	validates :duration, presence: true
end
