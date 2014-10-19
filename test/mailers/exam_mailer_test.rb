require 'test_helper'

class ExamMailerTest < ActionMailer::TestCase
  test "sending assignment notification" do
    quizmaster = users(:quizmaster)
    candidate = users(:candidate)
    assignment = { 
      exam: Exam.new(user: quizmaster), 
      user: candidate, 
      url: 'http://qizler.com/a423343' 
    }

    email = ExamMailer.notify_assignment(assignment).deliver

    assert_equal ['qizler@outlook.com'], email.from
    assert_equal [candidate.email], email.to
    assert_equal "Qizler: quizmaster sent you an assignment", email.subject
  end
end
