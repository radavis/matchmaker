class Company < ActiveRecord::Base
  COMPANY_SIZES = ["Startup (1-25)", "Funded (25-100)", "Corporation (100+)", "Megloconglomocorp (1000+)"]

  has_many :skills,as: :skillable,
    inverse_of: :company

  belongs_to :industry,
    inverse_of: :companies

  validates_presence_of :name

  validates_presence_of :email
  validates_format_of :email, with: /.+\@.+\..+/

  validates_presence_of :city
  validates_presence_of :state

  validates_presence_of :description
  validates_length_of :description, minimum: 10

  validates_inclusion_of :telecommute, in: [true, false]

  validates_presence_of :size, in: COMPANY_SIZES
  validates_numericality_of :year_founded

end
