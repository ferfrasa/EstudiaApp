class CreateUserTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_types do |t|
      t.string :nombre_user_type

      t.timestamps
    end
  end
end
