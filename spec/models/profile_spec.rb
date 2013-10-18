require 'spec_helper'

describe Profile do
  it { should belong_to :user }

  it { should have_valid(:first_name).when("Kate", "Lindsay") }
  it { should_not have_valid(:first_name).when(nil, "") }
  it { should have_valid(:last_name).when("Daly", "Davis") }
  it { should_not have_valid(:last_name).when(nil, "") }
  it { should have_valid(:city).when("Boston", "Atlanta") }
  it { should_not have_valid(:city).when(nil, "") }
  it { should have_valid(:state).when("MA", "NH") }
  it { should_not have_valid(:state).when(nil, "", "Nova Scotia") }
  it { should have_valid(:linkdin).when("linkedin.com/davisra") }
  it { should_not have_valid(:linkedin).when("http://www.google.com") }
  it { should have_valid(:github).when("http://www.github.com/theebeastmaster") }
  it { should_not have_valid(:github).when("http://www.google.com") }
  it { should have_valid(:twitter).when("https://twitter.com/bcardarella") }
  it { should_not have_valid(:twitter).when("http://www.google.com") }
  it { should have_valid(:blog).when("http://www.codecontainer.org") }
  it { should_not have_valid(:blog).when("http://www.google", "google.com" ) }
  it { should have_valid(:blog).when("http://stackoverflow.com/null") }
  it { should_not have_valid(:blog).when("http://www.google.com" ) }
  it { should have_valid(:relocate).when(true, false) }
  it { should_not have_valid(:relocate).when(nil, "", "yes") }

end
