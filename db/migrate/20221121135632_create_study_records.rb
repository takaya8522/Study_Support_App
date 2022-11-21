class CreateStudyRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :study_records do |t|
      t.string :title, null: false
      t.text :description
      t.string :learning_cycle, null: false
      t.boolean :comprehension, null: false, default: false

      t.timestamps
    end
  end
end
