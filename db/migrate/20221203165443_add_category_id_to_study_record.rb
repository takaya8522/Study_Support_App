class AddCategoryIdToStudyRecord < ActiveRecord::Migration[6.1]
  def change
    add_reference :study_records, :category, null: false, foreign_key: true
  end
end
