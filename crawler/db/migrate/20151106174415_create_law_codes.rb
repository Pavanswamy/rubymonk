class CreateLawCodes < ActiveRecord::Migration
  def change
    create_table :law_codes do |t|
      t.string :code
      t.text :description

      t.timestamps null: false
    end
  end
end
