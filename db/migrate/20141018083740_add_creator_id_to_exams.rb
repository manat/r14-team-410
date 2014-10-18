class AddCreatorIdToExams < ActiveRecord::Migration
  def change
  	add_column :exams, :creator_id, :integer
  end
end
