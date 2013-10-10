require 'spec_helper'

describe SkillTag do
  it { should belong_to :skill }
  it { should belong_to :company }
end
