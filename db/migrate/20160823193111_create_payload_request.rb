class CreatePayloadRequest < ActiveRecord::Migration
  def change
    create_table :payload_requests do |t|
      t.text     :url
      t.datetime :requested_at
      t.integer  :responded_in
      t.text     :referred_by
      t.text     :request_type
      t.text     :user_agent
      t.integer  :resolution_width
      t.integer  :resolution_height
      t.text     :ip

      t.timestamps null: false
    end
  end
end
