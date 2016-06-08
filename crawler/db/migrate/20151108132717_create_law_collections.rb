class CreateLawCollections < ActiveRecord::Migration
  def change
    create_table :law_collections do |t|
      t.string :abbrevation
      t.string :name
      t.text :url

      t.timestamps null: false
    end
  end
end
