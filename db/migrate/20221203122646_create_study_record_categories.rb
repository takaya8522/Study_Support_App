class CreateStudyRecordCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :study_record_categories do |t|
      t.references :study_record, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
