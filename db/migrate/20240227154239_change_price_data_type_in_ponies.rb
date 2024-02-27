class ChangePriceDataTypeInPonies < ActiveRecord::Migration[7.1]
  def change
    change_column :ponies, :price, :integer
  end
end
