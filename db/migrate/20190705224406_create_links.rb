class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :hashid
      t.string :uri

      t.timestamps
    end
  end
end
