require 'test_helper'

class ExamMailerTest < ActionMailer::TestCase
  test "sending assignment notification" do
    assignment = assignments(:assignment_one)
    candidate = assignment.user

    email = ExamMailer.notify_assignment(assignment).deliver

    assert_equal ['qizler@outlook.com'], email.from
    assert_equal [candidate.email], email.to
    assert_equal "Qizler: quizmaster sent you an assignment", email.subject
  end
end
