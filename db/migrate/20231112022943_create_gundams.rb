class CreateGundams < ActiveRecord::Migration[7.1]
  def change
    create_table :gundams do |t|
      t.string :name
      t.string :series
      t.string :scale

      t.timestamps
    end
  end
end
