class Point < ActiveRecord::Base
    belongs_to :user
    
    def determine_tag_and_update(goal, op)
        if goal == 'No Poverty'
            op == 'add' ? self.update({:poverty => self.poverty + 1}) : self.update({:poverty => self.poverty - 1})
        elsif goal == 'Zero Hunger'
            op == 'add' ? self.update({:hunger => self.hunger + 1}) : self.update({:hunger => self.hunger - 1})
        elsif goal == 'Good Health And Well-being'
            op == 'add' ? self.update({:health => self.health + 1}) : self.update({:health => self.health - 1})
        elsif goal == 'Quality Education'
            op == 'add' ? self.update({:education => self.education + 1}) : self.update({:education => self.education - 1})
        elsif goal == 'Gender Equality'
            op == 'add' ? self.update({:gender => self.gender + 1}) : self.update({:gender => self.gender - 1})
        elsif goal == 'Clean Water And Sanitation'
            op == 'add' ? self.update({:sanitation => self.sanitation + 1}) : self.update({:sanitation => self.sanitation - 1})
        elsif goal == 'Affordable And Clean Energy'
            op == 'add' ? self.update({:energy => self.energy + 1}) : self.update({:energy => self.energy - 1})
        elsif goal == 'Decent Work And Ecnomic Growth'
            op == 'add' ? self.update({:economy => self.economy + 1}) : self.update({:economy => self.economy - 1})
        elsif goal == 'Industry, Innovation And Infrastructure'
            op == 'add' ? self.update({:industry => self.industry + 1}) : self.update({:industry => self.industry - 1})
        elsif goal == 'Reduced Inqualities'
            op == 'add' ? self.update({:inequalities => self.inequalities + 1}) : self.update({:inequalities => self.inequalities - 1})
        elsif goal == 'Sustainale Cities And Communities'
            op == 'add' ? self.update({:cities => self.cities + 1}) : self.update({:cities => self.cities - 1})
        elsif goal == 'Responsible Consumption And Production'
            op == 'add' ? self.update({:consumption => self.consumption + 1}) : self.update({:consumption => self.consumption - 1})
        elsif goal == 'Climate Action'
            op == 'add' ? self.update({:climate => self.climate + 1}) : self.update({:climate => self.climate - 1})
        elsif goal == 'Life Below Water'
            op == 'add' ? self.update({:water => self.water + 1}) : self.update({:water => self.water - 1})
        elsif goal == 'Life On Land'
            op == 'add' ? self.update({:land => self.land + 1}) : self.update({:land => self.land - 1})
        elsif goal == 'Peace, Justice and Strong Institutions'
            op == 'add' ? self.update({:peace => self.peace + 1}) : self.update({:peace => self.peace - 1})
        elsif goal == 'Partnerships For The Goals'
            op == 'add' ? self.update({:partnerships => self.partnerships + 1}) : self.update({:partnerships => self.partnerships - 1})
        end
    end      
end
