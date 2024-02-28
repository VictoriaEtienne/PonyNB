class RemovePhotoFromPonies < ActiveRecord::Migration[7.1]
  def change
    remove_column :ponies, :photo, :string

  end
end
