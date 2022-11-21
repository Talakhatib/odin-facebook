class Friend < ApplicationRecord
    
    belongs_to :current_user , class_name:"User"
    belongs_to :other_user , class_name:"User"
end
