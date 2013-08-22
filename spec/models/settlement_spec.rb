require 'spec_helper'

describe Settlement do
  

  context "create settlement" do
    let(:settlement) { create(:settlement) }
    
    context "when valid" do
      it "should have a settlement id" do
        expect(settlement.id).should be_present
      end
    end

    it "has an amount" do
      settlement.amount.should be_present
    end

    it "has a payer id" do
      settlement.payer_id.should be_present
    end

    it "has a payee id" do
      settlement.payee_id.should be_present
    end
  end

  context "validate settlement" do
    let(:settlement) { build(:invalid_settlement) }
    it "should raise error when settlement name is blank" do
      expect { settlement.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

end