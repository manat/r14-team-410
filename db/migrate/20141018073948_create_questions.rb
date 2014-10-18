class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :description
      t.integer :question_type, default: 0
      t.string :choice1
      t.string :choice2
      t.string :choice3
      t.string :choice4
      t.text :solution
      t.references :exam, index: true

      t.timestamps
    end
  end
end
