class AddColumnToLines < ActiveRecord::Migration[7.0]
  def change
    add_column :lines, :status, :integer
  end
end
