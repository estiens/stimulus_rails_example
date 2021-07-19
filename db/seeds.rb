ANIMALS = %w[
  unicorn
  snake
  sheep
  pig
  penguin
  monkey
  koala
  horse
  dog
  crocodile
  chicken
  cat
  tiger
].freeze

ANIMALS.each do |animal|
  Animal.find_or_create_by(name: animal)
end
