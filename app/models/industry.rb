class Industry < ActiveRecord::Base
  has_many :companies,
    inverse_of: :industry
end
