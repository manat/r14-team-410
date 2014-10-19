# Preview all emails at http://localhost:3000/rails/mailers/exam_mailer
class ExamMailerPreview < ActionMailer::Preview
  def notify_assignment
    quizmaster = User.new(username: 'quizmaster')
    candidate = User.new(username: 'candidate', email: 'candidate@example.com')
    assignment = Assignment.new(
      id: 1,
      exam: Exam.new(user: quizmaster), 
      user: candidate, 
    )

    ExamMailer.notify_assignment(assignment)
  end
end
