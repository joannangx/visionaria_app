class Point < ActiveRecord::Base
    belongs_to :user
    
    def determine_op_and_update(op)
        if op == 'add'
            self.update({:amount => self.amount + 1})
        elsif op == 'sub'
            self.update({:amount => self.amount - 1})
        end
    end
        
end
