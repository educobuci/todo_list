require 'spec_helper'

describe List do  
  before do
    @user = Factory.create(:user)
  end
  
  it "filters the public lists" do
    List.publics.size.should be==1
    List.publics.first.public.should be==1
  end
  
  it "excludes a given user" do
    @other = Factory.create(:some_user)
    List.excluding_user(@other.id).size.should be==2
  end
end