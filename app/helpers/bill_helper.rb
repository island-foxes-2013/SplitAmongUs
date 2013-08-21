module BillHelper

	def responsibility_for(bill)
		bill.user == current_user ? "You're Owed" : "You owe"
	end
end