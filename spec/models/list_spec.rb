
require 'spec_helper'

describe List do
  let(:user) { create(:user) }
  let(:list) { user.lists.create(name: "Awesome List") }
  let!(:bill_1) { list.bills.create(amount: 950.00, description: "Rent", date: Date.today, user: user) }
  let!(:bill_2) { list.bills.create(amount: 75.00, description: "Electricity", date: Date.today, user: user) }

  context "create list" do

    it "can be instantiated" do
      expect(list).to be_an_instance_of(List)
    end

    context "when valid" do
      it "should have a user id" do
        expect(list.users.first.id).to eq(user.id)
      end
    end

    it "has a name" do
      list.name.should == "Awesome List"
    end
  end

  context "validate list" do

    it "should raise error when list name is blank" do
      list.name = nil
      expect { list.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "tallying money owed due to bills and settlements" do
    it "should fucking work"
  end

end
