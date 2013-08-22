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

  describe "total amount due in all lists" do
    let!(:user) { create(:user) }
    let(:friend1) { create(:user) }
    let(:list) { create(:list) }
    let(:list_2) { create(:list) }
    let!(:group) { Group.create(user_id: user.id, list_id: list.id) }
    let!(:group_2) { Group.create(user_id: friend1.id, list_id: list.id) }
    let!(:bill_1) { list.bills.create(amount: 950.50, description: "Rent", date: Date.today, user: user) }
    let!(:bill_2) { list.bills.create(amount: 75.26, description: "Electricity", date: Date.today, user: friend1) }
    let!(:bill_3) { list_2.bills.create(amount: 35.75, description: "Dinner", date: Date.today, user: user) }
    # let!(:settlement) { Settlement.create(payer_id: friend1.id, payee_id: user.id, amount: 200.00, list_id: list.id)}
    # let!(:settlement_2) { Settlement.create(payer_id: user.id, payee_id: friend1.id, amount: 100.00, list_id: list.id)}

    it "should calculate the total due" do
      before do
        sign_in(user)
      end

      expect(current_user.total_due_for_all_lists).to eq(Money.new(102526))

    end
  end  
end