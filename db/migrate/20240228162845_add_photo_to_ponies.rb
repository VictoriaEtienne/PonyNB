class AddPhotoToPonies < ActiveRecord::Migration[7.1]
  def change
    add_column :ponies, :photo, :string
  end
end
