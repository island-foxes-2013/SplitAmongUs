require 'spec_helper'

describe User do
  describe "#friends" do
    let!(:user) { create(:user) }
    let(:friend1) { create(:user) }
    # let(:friend2) { create(:user) }
    let(:list) { create(:list) }

    it "returns the list of people the user shares one or more groups with" do
      user.groups.create(list: list)
      friend1.groups.create(list: list)
      user.friends.should include friend1
    end
    it "should not include yourself in the list" do
      user.groups.create(list: list)
      user.friends.should_not include user
    end
    it "should not contain duplicate friends" do
      list2 = create(:list)
      group1 = user.groups.create(list: list)
      group2 = user.groups.create(list: list2)
      friend1.groups.create(list: list)
      friend1.groups.create(list: list2)
      user.friends.collect(&:id).should == user.friends.collect(&:id).uniq
    end
  end
end