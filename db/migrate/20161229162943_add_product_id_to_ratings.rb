class AddProductIdToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :product_id, :integer
  end
end
