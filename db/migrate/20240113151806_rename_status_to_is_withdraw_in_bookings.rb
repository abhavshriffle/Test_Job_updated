class RenameStatusToIsWithdrawInBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :status, :is_withdraw
  end
end
