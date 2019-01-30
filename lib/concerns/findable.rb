module Concerns::Findable



  def self.find_by_name(name)
    self.all.find do |song|
      if song.name == name
        song
      end
    end
  end






end
