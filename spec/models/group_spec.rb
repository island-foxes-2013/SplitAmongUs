require 'spec_helper'

describe Group do
   it "doesn't allow a user to be in the list more than once" do
    user = create(:user)
    list = create(:list)
    expect { user.groups.create!(list: list) }.to_not raise_error
    expect { user.groups.create!(list: list) }.to raise_error
  end
end