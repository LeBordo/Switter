class CreateSwits < ActiveRecord::Migration
  def change
    create_table :swits do |t|
      t.string :body
      t.string :author
      t.integer :likes
      t.integer :unlike

      t.timestamps
    end
  end
end
