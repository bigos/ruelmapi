class CreateRecs < ActiveRecord::Migration[6.0]
  def change
    create_table :recs do |t|
      t.float :value
      t.datetime :time
      t.text :tip

      t.timestamps
    end
  end
end
