class DropCreators < ActiveRecord::Migration
  def change
  	add_column :exams, :user_id, :integer
  	drop_table :creators
  end
end
