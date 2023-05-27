
require "pry"
class SorcerySchool

  @@unique_spells_available = ['fireball','earthquake','wall of water','lightning bolt']

  def self.assign_unique_spells
    if @@unique_spells_available.length > 0
      @@unique_spells_available.pop
    else
      'TBD'
    end
  end

end

module TimeStopabble
  def time_stop
    puts "I've stopped time!"
  end
end

module Miragable
  def mirage
    puts "These are not the droids you're looking for."
  end
end

class SorceryStudent

  def initialize
    @magical_energy = calc_magical_energy
    @unique_spell = SorcerySchool.assign_unique_spells
  end

  def to_s
    puts "============================"
    puts "School of Sorcery: #{self.class}"
    puts "Magical Energy: #{magical_energy}"
    puts "Unique Spell: #{unique_spell}"
    puts "Artifact: #{artifact}"
    puts "Robe Color: #{robe_color}"
    puts "============================"
  end

  private
  attr_accessor :magical_energy, :unique_spell, :artifact, :robe_color

  def calc_magical_energy(lower_range = 100, upper_range = 200)
    (lower_range..upper_range).to_a.sample
  end

end

class Illusionist < SorceryStudent
  include Miragable

  def initialize
    super
    @artifact = 'crystal ball'
    @robe_color = 'purple'
  end
end

class Enchanter < Illusionist
  include Miragable

  def initialize
    super
    @robe_color = 'gold'
    @magical_energy = calc_magical_energy(150,250)
  end

end

class Necromancer < SorceryStudent
  include TimeStopabble

  def initialize
    super
    @artifact = 'wooden staff'
    @robe_color = 'black'
    @magical_energy = calc_magical_energy(75, 175)
  end

  def create_zombie
    puts "I created a zombie!"
  end

end

class Conjurer < SorceryStudent
  include TimeStopabble
  include Miragable

  def initialize
    super
    @artifact = 'silver wand'
    @robe_color = 'green'
  end
end



i = Illusionist.new
e = Enchanter.new
n = Necromancer.new
c = Conjurer.new

puts i
puts e
puts n
puts c