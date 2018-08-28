class AddUniversityIdToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_reference :teachers, :university, foreign_key: true
  end
end
