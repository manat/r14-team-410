class ExamsController < ApplicationController
	before_action :set_exam, only: [:edit, :update, :destroy]

	def index
		@exams = Exam.where(user: current_user).order(created_at: :desc)
		@assignments = Assignment.where(exam: @exams).order(created_at: :desc)
	end

	def new
		@exam = Exam.new
		# render action: 'index'
	end

	def create
		@exam = Exam.new(exam_params)
		begin
			# create exam
			@exam.user = current_user
			@exam.save! #raise exception then rollback
			redirect_to exams_path #(current_user.company)
		rescue ActiveRecord::RecordInvalid
			render action: 'new'
		end
	end

	def edit
	end

	def update
		begin
			# update exam
			@exam.name = params[:exam][:name]
			@exam.description = params[:exam][:description]
			@exam.duration = params[:exam][:duration]
			@exam.save! #raise exception then rollback
			redirect_to exams_path
		rescue ActiveRecord::RecordInvalid
			render action: 'edit'
		end
	end

	def destroy
		@exam.destroy
		redirect_to exams_path
	end

	def assign
		exam       = Exam.find(params[:exam_id])
		candidate  = User.find_by(email: params[:email])
		candidate  = User.create!(:email => params[:email], :password => 'password', :password_confirmation => 'password') if candidate.nil?

		assignment = Assignment.find_by(user: candidate, exam: exam)
		if assignment.nil?
			assignment = Assignment.new(user: candidate, exam: exam)
			assignment.save!
		elsif assignment.score.nil? && assignment.finished_at.nil?
			assignment.delete
			assignment = Assignment.new(user: candidate, exam: exam)
			assignment.save!
		end

		# TODO: send email

		redirect_to exams_path
	end

	def evaluation
		@exam        = Exam.find(params[:exam_id])
		@assignments = Assignment.where(exam: @exam).order(created_at: :desc)
	end

	private
		def set_exam
			@exam = Exam.find(params[:id])
		end

		def exam_params
			params.require(:exam).permit(:name, :description, :duration)
		end


end
