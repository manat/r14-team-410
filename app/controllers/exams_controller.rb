class ExamsController < ApplicationController
	before_action :set_exam, only: [:show, :edit, :update, :destroy]

	def index
		current_user = Creator.first
		@exams = Exam.where(creator: current_user) 
	end

	def show
	end

	def new
		@exam = Exam.new
		# render action: 'index'
	end

	def create
		@exam = Exam.new(exam_params)
		begin
			# create exam
			@exam.creator = Creator.first
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

	private
		def set_exam
			@exam = Exam.find(params[:id])
		end

		def exam_params
			params.require(:exam).permit(:name, :description, :duration)
		end


end
