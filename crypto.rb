class String

  # These are methods that I will be using for crypto.
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

  # Setup an XOR
  def ^ (key)
      out_str = []
      hex_bytes = []
      key_bytes = []

      self.to_hex.split("").each_slice(2) {|x| hex_bytes << x.join}
      key.to_hex.split("").each_slice(2) {|x| key_bytes << x.join}
      hex_bytes.each_with_index{|h,i| out_str << (h.to_i(16) ^ key_bytes[i.modulo key_bytes.size].to_i(16)).chr}
      return out_str.join
  end
end