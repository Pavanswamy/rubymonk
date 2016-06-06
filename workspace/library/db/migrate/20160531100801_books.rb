class Books < ActiveRecord::Migration
   
   def self.up
      create_table :book do |t|
         t.column :title, :string, 
         t.column :price, :float
         t.column :subject_id, :integer
         t.column :description, :text
         t.column :created_at, :timestamp
      end
   end

   def self.down
      drop_table :book
   end
end