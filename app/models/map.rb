class Map < ApplicationRecord
  has_many :keywords, class_name: 'MapKeyword', dependent: :destroy
  has_many :live_hosts
  has_and_belongs_to_many :channels
end
