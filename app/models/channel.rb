class Channel < ApplicationRecord
  has_and_belongs_to_many :maps
end
