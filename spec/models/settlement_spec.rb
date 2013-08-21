require 'spec_helper'

describe Settlement do
  let(:user) { create(:user) }
  let(:list) { user.lists.create(name: "Awesome List") }
  let!(:bill_1) { list.bills.create(amount: 950.00, description: "Rent", date: Date.today, user: user) }
  let!(:bill_2) { list.bills.create(amount: 75.00, description: "Electricity", date: Date.today, user: user) }

  context "create settlement" do

    it "can be instantiated" do
      expect(settlement).to be_an_instance_of(Settlement)
    end

    context "when valid" do
      it "should have a list id" do
        expect(list.users.first.id).to eq(user.id)
      end
    end

    it "has an amount" do
      list.name.should == "Awesome List"
    end

    it "has a payer id" do
      list.name.should == "Awesome List"
    end

    it "has a payee id" do
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