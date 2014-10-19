class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :user, index: true
      t.references :exam, index: true
      t.decimal :score, precision: 5, scale: 2
      t.datetime :finished_at

      t.timestamps
    end
  end
end
