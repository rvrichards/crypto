class Vigenere
  BASE=65  # "A".ord=65 
  
  # key format: "ABC..."
  def encode(key, plaintext)
    k=key_2_int(key)
    pt2c = []
    plaintext.upcase.chars.each_with_index do |p,i|
      pt2c << p.ord-BASE + k[i%k.size]
    end
    int_2_chr(pt2c)
  end
  
  def decode(key, cipher)
    k=key_2_int(key)
    c2pt = []
    cipher.upcase.chars.each_with_index do |p,i|
      c2pt << p.ord-BASE - k[i%k.size]
    end
    int_2_chr(c2pt)
  end
  
  def key_2_int(key)
    key.upcase.chars.map { |k| k.ord-BASE }
  end  
  def int_2_chr(int_array)
    int_array.map { |i| (i+BASE).chr }.join
  end
end

plaintext="helloworld"
key="BCD"  

v=Vigenere.new 
cipher = v.encode(key,plaintext)
puts "cipher=#{cipher}"
puts v.decode(key,cipher)
