class String

  # These are methods that I will be using for crypto
  #
  # Given a string rep of a hex number, convert to an ascii String
  def from_hex()
    self.chop()
    self.scan(/[a-fA-F0-9]{2}/).map{|x| x.hex.chr}.join
  end

  # Given a string rep of a hex number, convert to an ascii String
  def from_hex2()
    self.scan(/../).map { |x| x.hex }.pack('c*')
  end 

  # Convert a string to hex notation in string notation
  def to_hex()
    self.unpack('H*').first
  end

  # Convert a string to hex notation - 2nd version
  def to_hex2()
    self.each_byte.map { |b| b.to_s(16) }.join
  end

end