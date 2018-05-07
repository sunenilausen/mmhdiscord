class CreateLiveHosts < ActiveRecord::Migration[5.1]
  def change
    create_table :live_hosts do |t|
      t.references :map
      t.string :bot_name
      t.string :message_id
      t.string :channel_id

      t.timestamps
    end
  end
end
