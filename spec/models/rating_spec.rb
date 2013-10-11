require 'spec_helper'

describe Rating do
  it { should belong_to :user }
  it { should belong_to :company }
  it { should have_valid (:user) }
  it { should have_valid (:company) }
end
