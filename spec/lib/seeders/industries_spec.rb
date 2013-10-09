require 'spec_helper'

describe Seeders::Industries do
  let (:seeder) {Seeders::Industries}

  it 'seeds industries' do
    seeded_industry = seeder.industries[0]
    seeder.seed
    expect(Industry.where(name: seeded_industry)).to be_present
  end

  it 'does not create duplicates' do
    seeder.seed
    count_after_seed = Industry.count
    seeder.seed
    expect(Industry.count).to  eql(count_after_seed)
  end

end
