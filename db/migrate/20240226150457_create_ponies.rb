class CreatePonies < ActiveRecord::Migration[7.1]
  def change
    create_table :ponies do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :alias
      t.string :sex
      t.string :color
      t.string :discipline
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
