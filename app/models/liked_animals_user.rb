class LikedAnimalsUser < ApplicationRecord
  belongs_to :animal
  belongs_to :user
end
