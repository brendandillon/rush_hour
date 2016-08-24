class CreateTablesForPayloadAttributes < ActiveRecord::Migration

  def change
    remove_column :payload_requests, :url
    remove_column :payload_requests, :referred_by
    remove_column :payload_requests, :request_type
    remove_column :payload_requests, :user_agent
    remove_column :payload_requests, :resolution_width
    remove_column :payload_requests, :resolution_height
    remove_column :payload_requests, :ip

    add_column :payload_requests, :url_id, :integer
    add_column :payload_requests, :referred_by_id, :integer
    add_column :payload_requests, :request_type_id, :integer
    add_column :payload_requests, :user_agent_id, :integer
    add_column :payload_requests, :resolution_id, :integer
    add_column :payload_requests, :ip_id, :integer

    create_table :ips do |t|
      t.text     :address

      t.timestamps null: false
    end

    create_table :urls do |t|
      t.text     :url

      t.timestamps null: false
    end

    create_table :resolutions do |t|
      t.integer  :resolution_width
      t.integer  :resolution_height

      t.timestamps null: false
    end

    create_table :request_types do |t|
      t.text     :request_type

      t.timestamps null: false
    end

    create_table :user_agents do |t|
      t.text     :user_agent

      t.timestamps null: false
    end
  end

end
