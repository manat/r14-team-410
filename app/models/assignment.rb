class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :exam

  def self.as_progress_pie_chart(quizmaster)
    finished = Assignment.joins(:exam)
                         .where('exams.user_id = ? AND finished_at IS NOT NULL', quizmaster)
                         .count
    unfinished = Assignment.joins(:exam)
                           .where('exams.user_id = ? AND finished_at IS NULL', quizmaster)
                           .count    

    { 'Finished' => finished, 'Not Started' => unfinished }
  end
end
