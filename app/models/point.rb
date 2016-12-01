class Point < ActiveRecord::Base
    belongs_to :user
    
    def determine_op_and_update(op)
        if op == 'add'
            self.update({:amount => self.amount + 1})
            if self.amount >= 1 and self.amount < 3 and self.level != 1
                self.update({:level => 1})
            elsif self.amount >=3 and self.amount < 5 and self.level != 2
                self.update({:level => 2})
            elsif self.amount >= 5 and self.level != ((self.amount / 5) + 2) 
                self.update({:level => (self.amount / 5) + 2})
            end    
        elsif op == 'sub'
            self.update({:amount => self.amount - 1})
            if self.amount < 1 and level != 0
                self.update({:level => 0})
            elsif self.amount >= 1 and self.amount < 3 and self.level != 1
                self.update({:level => 1})
            elsif self.amount >=3 and self.amount < 5 and self.level != 2
                self.update({:level => 2})
            elsif self.amount >= 5 and self.level != ((self.amount / 5) + 2)
                self.update({:level => (self.amount / 5) + 2})
            end 
        end
    end
        
end
