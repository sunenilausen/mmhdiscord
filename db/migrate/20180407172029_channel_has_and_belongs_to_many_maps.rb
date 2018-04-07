class ChannelHasAndBelongsToManyMaps < ActiveRecord::Migration[5.1]
  def change
    create_table :channels_maps, id: false do |t|
      t.belongs_to :channel, index: true
      t.belongs_to :map, index: true
    end
  end
end
