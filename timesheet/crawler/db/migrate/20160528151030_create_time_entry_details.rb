class CreateTimeEntryDetails < ActiveRecord::Migration
  def change
    create_table :time_entry_details do |t|
      t.integer :project_id
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.boolean :is_approved, default: false
      t.integer :hours

      t.timestamps null: false
    end
  end
end
