class SkillTag < ActiveRecord::Base
  belongs_to :skill
  belongs_to :company
end
