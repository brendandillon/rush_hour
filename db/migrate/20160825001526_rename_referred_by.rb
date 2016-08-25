class RenameReferredBy < ActiveRecord::Migration
  def change
    rename_table :referred_by, :referred_bies
  end
end
