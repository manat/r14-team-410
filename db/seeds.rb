# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Creator.delete_all
Exam.delete_all
Question.delete_all

creator_a = Creator.create(name: 'mr. a')
exam_a    = Exam.create!(name: 'Exam A', description: 'Exam for ruby on rails developer', duration: 60, creator: creator_a)
exam_b    = Exam.create!(name: 'Exam B', description: 'Exam for java developer', duration: 60, creator: creator_a)
exam_a    = Exam.create!(name: 'Exam A', description: 'Exam for ruby on rails developer', duration: 60, creator: creator_a)
exam_b    = Exam.create!(name: 'Exam B', description: 'Exam for java developer', duration: 60, creator: creator_a)
exam_a    = Exam.create!(name: 'Exam A', description: 'Exam for ruby on rails developer', duration: 60, creator: creator_a)
exam_b    = Exam.create!(name: 'Exam B', description: 'Exam for java developer', duration: 60, creator: creator_a)
exam_a    = Exam.create!(name: 'Exam A', description: 'Exam for ruby on rails developer', duration: 60, creator: creator_a)

question_a = Question.create!(title: 'question a', description: 'test', choice1: 'choice a', choice2: 'choice b', choice3: 'choice c', choice4: 'choice d', solution: '1', exam: exam_a)
question_b = Question.create!(title: 'question b', description: 'test', choice1: 'choice a', choice2: 'choice b', choice3: 'choice c', choice4: 'choice d', solution: '1', exam: exam_a)
question_c = Question.create!(title: 'question c', description: 'test', choice1: 'choice a', choice2: 'choice b', choice3: 'choice c', choice4: 'choice d', solution: '1', exam: exam_a)
question_d = Question.create!(title: 'question d', description: 'test', choice1: 'choice a', choice2: 'choice b', choice3: 'choice c', choice4: 'choice d', solution: '1', exam: exam_a)