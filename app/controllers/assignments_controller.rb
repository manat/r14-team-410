class AssignmentsController < ApplicationController
	before_action :set_assignment, only: [:show, :submit]
	
	def show
		unless @assignment.finished_at.nil?
			render action: 'submit'
		end
		@questions = Question.where(exam: @assignment.exam).order(created_at: :asc)
	end

	def submit
		answers = params[:question]

		@score = 0
		answers.each do |answer|
			question = @assignment.exam.questions.select{ |q| q.id == answer[0].to_i }.first
			@score = @score + 1 if question.solution.to_i == answer[1].to_i
		end
		@score = (100 / answers.size) * @score
		
		@assignment.update(score: @score, finished_at: Time.now)
	end

	private
		def set_assignment
			@assignment = Assignment.find(params[:id])
		end

end
