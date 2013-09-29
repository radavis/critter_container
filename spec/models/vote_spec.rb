require 'spec_helper'

describe Vote do
  it { should belong_to(:voteable) }

  it { should have_valid(:value).when(1, -1) }
  it { should_not have_valid(:value).when(2, 3, -50, 9999) }
end
