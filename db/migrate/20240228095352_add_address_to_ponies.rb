class AddAddressToPonies < ActiveRecord::Migration[7.1]
  def change
    add_column :ponies, :address, :string
  end
end
