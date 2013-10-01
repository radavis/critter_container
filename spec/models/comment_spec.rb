require 'spec_helper'

describe Comment do
  it { should have_valid(:comment).when('My cat is so fat!!!') }
  it { should_not have_valid(:comment).when(nil, '') }

  it { should belong_to(:user) }
  it { should belong_to(:picture) }
end
