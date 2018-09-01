class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :nombre_project
      t.text :descripcion_project
      t.float :califiacion_projeact, default: 0
      t.boolean :estado_project ,default: true
      t.references :category, foreign_key: true
      t.references :spectator, foreign_key: true

      t.timestamps
    end
  end
end
