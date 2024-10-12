class Pet < ApplicationRecord
  SPECIES = %w[dog cat turtle dragon snake rabbit].freeze

  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES}

  def found_days_ago
    number_of_days = (Date.today - found_on).to_i
    if number_of_days.zero?
      'today'
    elsif number_of_days == 1
      'yesterday'
    else
      "#{number_of_days} days ago"
    end
  end
end
