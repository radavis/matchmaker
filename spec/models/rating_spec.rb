require 'spec_helper'

describe Rating do
  it { should belong_to :user }
  it { should belong_to :company }
  it { should have_valid (:user) }
  it { should have_valid (:company) }

  it { should have_valid(:value).when(1, 2, 3, 4, 5) }
  it { should_not have_valid(:value).when(0, -5, 3.3, '', nil) }
end
