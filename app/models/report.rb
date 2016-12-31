class Report < ApplicationRecord
    
    scope :latest, -> { where(batch_id: maximum(:batch_id)) }

    def self.bump_batch_id
        new_batch_id = self.maximum(:batch_id) + 1
        self.where(batch_id: 0).update_all(batch_id: new_batch_id)
    end

end
