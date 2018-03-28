class Museum

  attr_reader :name,
              :exhibits,
              :revenue,
              :visits

  def initialize(name)
    @name = name
    @exhibits = {}
    @revenue = 0
    @general_admittance = 10
    @visits = {}
  end

  def add_exhibit(exhibit_name, cost)
    @exhibits.store(exhibit_name, cost)
  end

  def admit(patron)
    @revenue += @general_admittance
    list = patron.interests
    patron_cost = []
    list.map do |interest|
      @visits.store(interest, patron.name)
      cost = @exhibits[interest]
      patron_cost << cost
    end
    @revenue += patron_cost.join.to_i
  end

  def patrons_of(exhibit)
    @visits.values_at(exhibit)
  end
end
