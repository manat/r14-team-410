require 'test_helper'

describe Question do
  describe "when a new question is created" do
    it "must be multiple choices by default" do
      Question.new(title: 'First Quiz Ever!').choices?.must_equal true
    end
  end
end
