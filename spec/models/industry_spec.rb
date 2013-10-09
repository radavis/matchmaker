require 'spec_helper'

describe Industry do

  it { should have_many(:companies) }

  it { should have_valid(:name).when('Financial Services', 'Internet') }
  it { should_not have_valid(:name).when(nil, '') }

end
