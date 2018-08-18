class CreateStatusActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :status_activities do |t|
      t.string :nombre_status_activity

      t.timestamps
    end
  end
end
