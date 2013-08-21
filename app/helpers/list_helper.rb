module ListHelper

  def total_due_for_all_lists
    @total = Money.new(0, "USD") 
      current_user.lists.each do |list| 
        list.bills.each do |bill|  
          @total += bill.amount 
        end 
      end 
    @total   
  end
end