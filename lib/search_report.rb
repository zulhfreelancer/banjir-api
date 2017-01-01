module SearchReport
    
    def self.both_daerah_and_negeri_present?(params)
        params[:daerah].present? && params[:negeri].present?
    end

    def self.either_daerah_or_negeri_present?(params)
        params[:daerah].present? || params[:negeri].present?
    end

    def self.daerah_and_negeri(params)
        Report.latest.where('LOWER(daerah) = ? AND LOWER(negeri) = ?',\
                            params[:daerah], params[:negeri])
    end

    def self.daerah_or_negeri(params)
        Report.latest.where('LOWER(daerah) = ? OR LOWER(negeri) = ?',\
                            params[:daerah], params[:negeri])
    end
    
    def self.perform_search(params)
        return daerah_and_negeri(params) if both_daerah_and_negeri_present?(params)
        return daerah_or_negeri(params)  if either_daerah_or_negeri_present?(params)
        Report.latest
    end

end
