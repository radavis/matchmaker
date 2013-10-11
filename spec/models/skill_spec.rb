require 'spec_helper'

describe Skill do
  it { should have_many :skill_tags }
  it { should have_many :companies }
end
