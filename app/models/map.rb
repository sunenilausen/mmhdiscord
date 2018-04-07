class Map < ApplicationRecord
  has_many :keywords, class_name: 'MapKeyword', dependent: :destroy
end
