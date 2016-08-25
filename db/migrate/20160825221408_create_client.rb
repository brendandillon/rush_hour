class CreateClient < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.text :root_url
      t.text :identifier

      t.timestamps null: false
    end

    add_column :payload_requests, :client_id, :integer
  end
end
