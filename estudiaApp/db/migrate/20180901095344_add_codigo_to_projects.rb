class AddCodigoToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :codigo, :integer, :default => (0..9999).to_a.sample, unique: true
  end
end
