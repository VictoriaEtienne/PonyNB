class RenameColumnTypeToBreed < ActiveRecord::Migration[7.1]
  def change
    rename_column :ponies, :type, :breed
  end
end
