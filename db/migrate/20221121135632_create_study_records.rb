class CreateStudyRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :study_records do |t|
      t.string :title
      t.text :description
      t.string :learning_cycle
      t.boolean :comprehension

      t.timestamps
    end
  end
end
