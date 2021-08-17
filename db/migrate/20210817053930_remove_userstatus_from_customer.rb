class RemoveUserstatusFromCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :userstatus, :boolean
  end
end
