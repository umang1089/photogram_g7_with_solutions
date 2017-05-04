class RandomId
  attr_reader :value

  def initialize(value = rand(100))
    @value = value
  end

  def next
    next_value = value + rand(100)
    RandomId.new(next_value)
  end

  def to_s
    value.to_s
  end
end

FactoryGirl.define do
  factory :photo do
    sequence(:id, RandomId.new)
    sequence(:source, RandomId.new) { |n| "https://some.image/url#{n}.jpeg" }
    sequence(:caption, RandomId.new) { |n| "Some caption #{n}" }
  end
end
