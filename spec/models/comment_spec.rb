require 'spec_helper'

describe Comment do
  text = ""

  it { should have_valid(:comment).when('My cat is so fat!!!') }
  it { should_not have_valid(:comment).when(nil, '','foo',340.times { text << 'a' }) }

  it { should belong_to(:user) }
  it { should belong_to(:picture) }

  
end
