class RenameUserAgentIdColumn < ActiveRecord::Migration
  def change
    rename_column :payload_requests, :user_agent_id, :os_and_browser_id
  end
end
