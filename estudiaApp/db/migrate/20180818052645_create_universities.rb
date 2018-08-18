class CreateUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :universities do |t|
      t.string :nombre_university

      t.timestamps
    end
  end
end
