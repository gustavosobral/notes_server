class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.datetime :last_seen

      t.timestamps null: false
    end
  end
end
