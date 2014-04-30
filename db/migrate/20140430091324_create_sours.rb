class CreateSours < ActiveRecord::Migration
  def change
    create_table :sours do |t|
      t.integer :swit_id
      t.string :username

      t.timestamps
    end
  end
end
