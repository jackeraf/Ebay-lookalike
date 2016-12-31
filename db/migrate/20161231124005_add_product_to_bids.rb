class AddProductToBids < ActiveRecord::Migration[5.0]
  def change
    add_reference :bids, :product, foreign_key: true
  end
end
