class Skill < ActiveRecord::Base
  has_many :skill_tags
  has_many :companies, through: :skill_tags
end
