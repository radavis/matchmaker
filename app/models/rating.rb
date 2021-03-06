class Rating < ActiveRecord::Base
  belongs_to :company, inverse_of: :ratings
  belongs_to :user, inverse_of: :ratings

  validates_inclusion_of :value, in: 1..5
  validates_numericality_of :value, only_integer: true
end
