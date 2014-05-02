class CreateDoortags < ActiveRecord::Migration
  def change
    create_table :doortags do |t|
      t.integer :swit_id
      t.string :tag

      t.timestamps
    end
  end
end
