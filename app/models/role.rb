class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        auditions.pluck(:actor)
    end

    def locations
        auditions.pluck(:location)
    end

    def lead 
        hired = self.auditions.find_by(hired: true) || "no actor has been hired for this role"
    end

    def understudy
        self.auditions.where(hired:true).second||"no actor has been hired for understudy for this role"
    end
end