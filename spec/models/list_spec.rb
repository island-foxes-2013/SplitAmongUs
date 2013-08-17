
require 'spec_helper'

describe List do
  let(:list) { List.new(name: "Awesome List") }

  context "create list" do

    it "can be instantiated" do
      expect(list).to be_an_instance_of(List)
    end

    it "can be saved successfully" do
      expect { list.save }.to change(List, :count).by(1)
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
end