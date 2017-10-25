# One-time pad
class OneTimePad

  def clean_string(s);
    s.upcase.delete("^a-zA-Z")  # Strip out all special characters and numbers
  end

  def make_key(len)
    Array.new(len) { rand(26) }
  end

  def encrypt(plaintext, key)
    enc=[]
    plaintext=clean_string(plaintext)
    puts "Encrypting plaintext => #{plaintext}"
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
key=c.make_key(plaintext.length)
puts "result key=#{key}"
enc=c.encrypt(plaintext, key )
puts "encrypt = #{enc}"
dec=c.decrypt(enc,key )
puts "decrypt = #{dec}"
