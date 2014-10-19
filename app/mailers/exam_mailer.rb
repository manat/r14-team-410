class ExamMailer < ActionMailer::Base
  default from: 'qizler@outlook.com'

  def notify_assignment(assignment)
    @exam = assignment[:exam]
    @quizmaster = @exam.user
    @user = assignment[:user]
    @url = assignment[:url]
    mail(to: @user.email, subject: "Qizler: #{@exam.user.username} sent you an assignment")
  end
end
