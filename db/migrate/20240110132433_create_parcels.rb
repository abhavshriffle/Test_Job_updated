class CreateParcels < ActiveRecord::Migration[7.0]
  def change
    create_table :parcels do |t|

      t.timestamps
    end
  end
end
