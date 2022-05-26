class AddRateToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :star, :float, null: false, default: 0
  end
end
