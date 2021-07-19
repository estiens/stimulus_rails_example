module AnimalHelper
  def animal_display_class(animal:, user: nil)
    return 'colorize-blue' unless user

    if animal.liked_by_user?(user: user)
      'colorize-green'
    elsif animal.disliked_by_user?(user: user)
      'colorize-red'
    else
      'colorize-blue'
    end
  end
end
