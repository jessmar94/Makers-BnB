class ChangePpnmColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :spaces, :ppnd, :ppn
  end
end
