class Industry < ActiveRecord::Base
  has_many :companies,
    inverse_of: :industry

  validates_presence_of :name
end
