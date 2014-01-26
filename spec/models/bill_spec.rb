require 'spec_helper'

describe Bill do
  
  let(:user) { create(:user) }
  let(:user_two) { create(:user) }
  let(:list) { user.lists.create(name: 'test list') }
  let(:bill) { create(:bill, list: list, user: user) }

  context 'create bill' do
    
    it 'can be instantiated' do
      expect(bill).to be_an_instance_of(Bill)
    end
    
    it "can be saved successfully" do
      expect { bill.save }.to change(Bill, :count).by(1)
    end

    it "has a description" do
      expect(bill.description).not_to eq(nil)
    end

    it 'has an amount' do
      expect(bill.amount).not_to eq(nil)
    end

    it 'has a date' do
      expect(bill.date).not_to eq(nil)
    end

    it 'has a list_id' do
      expect(bill.list_id).not_to eq(nil)
    end

    context "when user belong to a list" do 
      it "can create a bill for that list" do 
        expect(bill.user_id).to eq(user.id)
      end
    end

    context "when a user does not belong to a list" do 
      let(:bill_two) { build(:bill, list: list, user: user_two) }
      it "can't create a bill" do 
      p "this is bill two #{bill_two.inspect}"

        expect{ bill_two.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end 
  end

  context "validate bill" do

    context "should raise error" do
      
      it "when description is blank" do
        bill.description = nil
        expect { bill.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "when amount is blank" do
        bill.amount = ''
        expect { bill.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "when list_id is blank" do
        bill.list_id = nil
        expect { bill.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "when user_id is blank" do
        bill.user_id = nil
        expect { bill.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "when date is blank" do
        bill.date = nil
        expect { bill.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  context "find user who paid the bill" do
    # unsure if this test works, all tests on this page are failing
    context "paid by" do
      before {bill.paid_by}

      it "should return the user id" do
        expect(list.users.first.id).to eq(user.id)
      end
    end
  end
end
