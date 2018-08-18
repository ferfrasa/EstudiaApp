class CreateTypeActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :type_activities do |t|
      t.string :nombre_type_activity

      t.timestamps
    end
  end
end
