class AddColumnToLine < ActiveRecord::Migration[7.0]
  def change
    add_column :lines, :name, :string
  end
end
