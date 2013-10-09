class Skill < ActiveRecord::Base
  belongs_to :skillable, polymorphic: true

  belongs_to :company,
    inverse_of: :skills
end
