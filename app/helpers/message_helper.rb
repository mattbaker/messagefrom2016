module MessageHelper
    def days_to_election
        (Date.new(2018,11,6) - Date.today).to_i
    end
end
