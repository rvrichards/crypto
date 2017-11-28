# One-time pad
class OneTimePad

   # Strip out all special characters and numbers
  def clean_string(s);
    s.upcase.delete("^a-zA-Z")
  end

  # Make key of random chars of length "len".
  def make_key(len)
    Array.new(len) { rand(26) }
  end

  def encrypt(plaintext, key)
    enc=[]
    plaintext=clean_string(plaintext)
    return false if plaintext.length>key.length  # ok if key is greater or equal
    pt=plaintext.chars.map { |ch| ch.ord-65 }
    pt.each_with_index { |p,i| enc[i] = (((p+key[i]) % 26)+65).chr }
    enc.join
  end

  def decrypt(ciphertext, key)
    dec=[]
    ct=ciphertext.chars.map { |x| x.ord-65 }
    ct.each_with_index { |c,i| dec[i] = (((c-key[i]) % 26)+65).chr }
    dec.join
  end
end


c=OneTimePad.new
plaintext="hello world"
k=c.clean_string(plaintext)
key=c.make_key(k.length)
puts "result key=#{key}"
puts "plaintxt= #{k}"
puts "key map = #{ key.map {|x| (x.ord+65).chr }.join }"
enc=c.encrypt(plaintext, key )
puts "encrypt = #{enc}"
dec=c.decrypt(enc,key )
puts "decrypt = #{dec}"
