class RemoveRequestType < ActiveRecord::Migration
  def change
    remove_column :request_types, :request_type
  end
end
