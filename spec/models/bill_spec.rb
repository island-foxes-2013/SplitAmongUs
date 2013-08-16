require 'spec_helper'

describe Bill do
  
  # create factory girl testing data

  context 'create bill' do
    context 'when valid' do
      it 'should allow mass-assignment on description' 
      it 'should allow mass-assignment on amount'
      it 'should allow mass-assignment on date'
    end

    context 'when invalid' do
      it 'should not allow mass-assignment on list_id'
      it 'should not allow mass-assignment on paid'
      it 'should not allow mass-assignment on date_paid'
    end
  end
end
