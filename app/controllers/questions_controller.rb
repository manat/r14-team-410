class QuestionsController < ApplicationController
	before_action :set_question, only: [:show, :edit, :update, :destroy]
	before_action :set_exam

	def index
	end

	def show
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		begin
			@question.exam = @exam
			@question.save!
			redirect_to exam_questions_path(@exam) 
		rescue ActiveRecord::RecordInvalid
			render action: 'new'
		end
	end

	def edit
	end

	def update
		begin
			@question.update!(question_params)
			redirect_to exam_questions_path(@exam) 
		rescue ActiveRecord::RecordInvalid
			render action: 'edit'
		end
	end

	def destroy
		@question.destroy
		redirect_to exam_questions_path(@exam)
	end

	private
		def set_exam
			@exam = Exam.find(params[:exam_id])
			@questions = Question.where(exam: @exam).order(created_at: :asc)
		end

		def set_question
			@question = Question.find(params[:id])
		end

		def question_params
			params.require(:question).permit(:title, :description, :question_type, :choice1, :choice2, :choice3, :choice4, :solution)
		end

end
