class Profile < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :city
  validates_presence_of :state
  validates_inclusion_of :relocate, in: [ true, false ]

  validates_format_of :linkedin, with: /http.*linkedin.com/
  validates_format_of :github, with: /http.*github.com/
  validates_format_of :twitter, with: /http.*twitter.com/
  validates_format_of :blog, with: /http.*\..*/
  validates_format_of :stackoverflow, with: /http.*stackoverflow.com/


  STATES = ['Alabama','Alaska','Arizona''Arkansas','California','Colorado','Connecticut',
    'Delaware','District of Columbia', 'Florida','Georgia','Hawaii','Idaho','Illinois','Indiana',
    'Iowa','Kansas','Kentucky','Louisiana','Maine', 'Maryland','Massachusetts','Michigan','Minnesota',
    'Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico',
    'New York','North Carolina','North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico',
    'Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virginia',
    'Washington','West Virginia','Wisconsin','Wyoming']

   validates_inclusion_of :state, in: STATES
end
