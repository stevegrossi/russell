require "russell/version"
require "citrus"

Citrus.load(Gem::Specification.find_by_name('russell').gem_dir + '/lib/russell/symbolic_logic.citrus')

module Russell

  def self.given(*assumptions)
    assumptions.each do |assumption|
      puts "Assuming: #{assumption}"
    end
  end

  def self.parse(string)
    SymbolicLogic.parse(string)
  end
end
