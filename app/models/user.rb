class User < ApplicationRecord
  has_many :liked_animals_users
  has_many :liked_animals, through: :liked_animals_users, source: :animal, class_name: 'Animal'

  has_many :disliked_animals_users
  has_many :disliked_animals, through: :disliked_animals_users, source: :animal, class_name: 'Animal'
end
