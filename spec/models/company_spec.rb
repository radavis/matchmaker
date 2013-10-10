require 'spec_helper'

describe Company do

  it { should belong_to(:industry) }

  it { should have_valid(:industry) }

  it { should have_valid(:name).when('Umbrella Corporation', 'Launch Academy') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:email).when('john@umbrella.com', 'adam@launchacademy.co') }
  it { should_not have_valid(:email).when(nil, '', 'z.com') }

  it { should have_valid(:city).when('Seattle', 'Boston') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('WA', 'MA') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:description).when('A great place to work.') }
  it { should_not have_valid(:description).when(nil, '', 'awesome') }

  it { should have_valid(:telecommute).when(true, false) }
  it { should_not have_valid(:telecommute).when(nil, '') }

  it { should have_valid(:size).when('Startup', 'Megacorp') }
  it { should_not have_valid(:size).when(nil, '') }

  it { should have_valid(:year_founded).when(2013, 1984) }
  it { should_not have_valid(:year_founded).when(nil, '') }

  it { should have_many :skill_tags }
  it { should have_many :skills }

end
