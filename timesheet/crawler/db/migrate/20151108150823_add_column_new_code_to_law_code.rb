class AddColumnNewCodeToLawCode < ActiveRecord::Migration
  def change
    add_column :law_codes, :new_code, :string
  end
end
