class AddColumnArticleNumberToLawCodes < ActiveRecord::Migration
  def change
    add_column :law_codes, :article_number, :string
  end
end
