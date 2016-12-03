class AddMensaIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mensa_id, :string
  end
end
