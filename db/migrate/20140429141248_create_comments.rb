class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :swit_id
      t.string :body
      t.string :author

      t.timestamps
    end
  end
end
