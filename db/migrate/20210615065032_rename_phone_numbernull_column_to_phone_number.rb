class RenamePhoneNumbernullColumnToPhoneNumber < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :phone_numbernull, :phone_number
  end
end
