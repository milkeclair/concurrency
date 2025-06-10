class AddAccount < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false, limit: 20
      t.string :email, null: false, limit: 255
      t.string :password, null: false
      t.timestamps null: false
    end

    add_index :accounts, :email, unique: true
  end
end
