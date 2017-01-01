class Report < ApplicationRecord
    
    before_create :set_lat_long
    before_create :generate_google_maps_url
    scope :latest, -> { where(batch_id: maximum(:batch_id)) }

    def self.bump_batch_id
        new_batch_id = self.maximum(:batch_id) + 1
        self.where(batch_id: 0).update_all(batch_id: new_batch_id)
    end

    def daerah_and_state
        [self.daerah, self.negeri].compact.join(', ') 
    end

    def nama_jalan_full
        jalan = self.nama_jalan.present? ? self.nama_jalan : ""
        daerah_and_state.prepend("#{jalan}, ")
    end

    def set_lat_long
        lat_long = get_jalan_lat_long.present? ? get_jalan_lat_long : get_daerah_lat_long
        self.latitude  = lat_long[0] if lat_long.present?
        self.longitude = lat_long[1] if lat_long.present?
    end

    def get_jalan_lat_long
        begin
            Geocoder.coordinates(self.nama_jalan_full)
        rescue Exception
            return nil
        end
    end

    def get_daerah_lat_long
        begin
            Geocoder.coordinates(self.daerah_and_state)
        rescue Exception
            return nil 
        end
    end

    def generate_google_maps_url
        return nil if self.latitude.nil? || self.longitude.nil?
        url  = "https://www.google.com/maps?q=#{self.latitude},#{self.longitude}"
        self.google_maps_url = url
    end

end
