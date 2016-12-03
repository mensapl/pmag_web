class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.references :creator
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.text :description
      t.boolean :accepted

      t.timestamps
    end
  end
end
