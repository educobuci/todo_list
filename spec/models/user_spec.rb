require 'spec_helper'

describe User do
  before do
    @user = Factory.create(:user)
    @some_user = Factory.create(:some_user)
  end
  
  it "keeps all the following lists" do
    @user.following<<@some_user.lists.first
    @user.following.size.should be==1
  end
end