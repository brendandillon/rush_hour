class CreateTableForAttr < ActiveRecord::Migration
  def change
    add_column :request_types, :request_type, :text
  end
end
