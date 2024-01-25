class RemoveStatusFromOffers < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :status, :string
  end
end
