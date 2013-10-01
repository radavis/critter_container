require 'spec_helper'

describe Picture do
  it { should have_valid(:title).when("cat") }
  it { should_not have_valid(:title).when(nil, '') }

  it 'checks the type of image' do
    expect(Picture.new(title: 'cat').check_type?('image')).to eql(true)
  end

  # it { should validate_presence_of(:image) }
end
