require 'spec_helper'

describe User do
  it { should have_valid(:alias).when('Cat_Lady', 'fehsdkjghdfkjghdg') }
  it { should_not have_valid(:alias).when(nil, '') }
  it { should have_valid(:email).when('drm336@nyu.edu', 'user@xample.com') }
  it { should_not have_valid(:email).when(nil, '') }
  
end
