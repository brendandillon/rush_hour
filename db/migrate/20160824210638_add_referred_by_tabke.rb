class AddReferredByTabke < ActiveRecord::Migration
  def change
    create_table :referred_by do |t|
      t.text  :address

      t.timestamps null: false
    end

    remove_column :urls, :url
    add_column :urls, :address, :text

    remove_column :request_types, :request_type
    add_column :request_types, :verb, :text

    remove_column :user_agents, :user_agent
    add_column :user_agents, :browser, :text
    add_column :user_agents, :operating_system, :text

  end
end
