class CreateGatheringEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :gathering_entries do |t|
      t.boolean :going
      t.boolean :paid
      t.date :pay_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
