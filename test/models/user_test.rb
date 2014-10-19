require 'test_helper'

describe User do
  describe 'user with quizmaster role' do
    before do
      @user = users(:quizmaster)
      @another_user = users(:admin)
      @ability = Ability.new(@user)
    end

    it 'can only crud exams which he/she owns' do
      @ability.can?(:create, Exam.new(user: @user)).must_equal true
      @ability.cannot?(:create, Exam.new(user: @another_user)).must_equal true
    end

    it 'can only crud questions which he/she owns' do
      exam = Exam.new(user: @user)
      another_exam = Exam.new(user: @another_user)

      @ability.can?(:create, Question.new(exam: exam)).must_equal true
      @ability.cannot?(:create, Question.new(exam: another_exam)).must_equal true
    end
  end

  describe 'user with admin role' do
    before do
      @user = users(:admin) 
      @ability = Ability.new(@user)
    end

    it 'can manage everything' do
      @ability.can?(:create, Exam.new(user: @user)).must_equal true
      @ability.can?(:create, Question.new).must_equal true
    end
  end
end
