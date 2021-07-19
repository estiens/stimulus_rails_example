class Animal < ApplicationRecord

  def image_path
    "media/images/animal_icons/#{name}.svg"
  end

  def liked_by_user?(user:)
    user.liked_animals.include? self
  end

  def disliked_by_user?(user:)
    user.disliked_animals.include? self
  end
end
