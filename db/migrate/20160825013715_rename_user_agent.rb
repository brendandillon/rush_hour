class RenameUserAgent < ActiveRecord::Migration
  def change
    rename_table :user_agents, :os_and_browsers
  end
end
