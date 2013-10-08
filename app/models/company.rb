class Company < ActiveRecord::Base
  validates_presence_of :name

  validates_presence_of :email
  validates_format_of :email, with: /.+\@.+\..+/

  validates_presence_of :city
  validates_presence_of :state

  validates_presence_of :description
  validates_length_of :description, minimum: 10

  validates_inclusion_of :telecommute, in: [true, false]
  validates_presence_of :industry
  validates_presence_of :size
  validates_numericality_of :year_founded

end