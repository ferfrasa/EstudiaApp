class CreateHasCategoryAs < ActiveRecord::Migration[5.1]
  def change
    create_table :has_category_as do |t|
      t.references :article, foreign_key: true
      t.references :category_a, foreign_key: true

      t.timestamps
    end
  end
end
