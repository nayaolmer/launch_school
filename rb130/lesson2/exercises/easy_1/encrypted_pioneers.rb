

def decrypt_pioneer(some_pioneer)
  alphabet = %w( a b c d e f g h i j k l m n o p q r s t u v w x y z )
  key = %w( n o p q r s t u v w x y z a b c d e f g h i j k l m )
  decrypter = {}
  alphabet.each_with_index do |letter, idx|
    decrypter[key[idx]] = letter
  end

  decrypted_name = []
  some_pioneer.downcase.split('').each do |l|
    if l == ' '
      decrypted_name << l
    else
      decrypted_name << decrypter[l]
    end
  end

  decrypted_name.join.split.map {|name| name.capitalize}.join(' ')
end


def decipher_character(encrypted_char)
  case encrypted_char
    when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
    when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
    else encrypted_char
  end
end

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end





p rot13('Nqn Ybirynpr')
p rot13('Tenpr Ubccre')
p rot13('Nqryr Tbyqfgvar')
p rot13('Nyna Ghevat')
p rot13('Puneyrf Onoontr')
p rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p rot13('Wbua Ngnanfbss')
p rot13('Ybvf Unvog')
p rot13('Pynhqr Funaaba')
p rot13('Fgrir Wbof')
p rot13('Ovyy Tngrf')
p rot13('Gvz Orearef-Yrr')
p rot13('Fgrir Jbmavnx')
p rot13('Xbaenq Mhfr')
p rot13('Fve Nagbal Ubner')
p rot13('Zneiva Zvafxl')
p rot13('Lhxvuveb Zngfhzbgb')
p rot13('Unllvz Fybavzfxv')
p rot13('Tregehqr Oynapu')







# "Ada Lovelace"
# "Grace Hopper"
# "Adele Goldstine"
# "Alan Turing"
# "Charles Babbage"
# "Abdullah Muhammad bin Musa al-Khwarizmi"
# "John Atanasoff"
# "Lois Haibt"
# "Claude Shannon"
# "Steve Jobs"
# "Bill Gates"
# "Tim Berners-Lee"
# "Steve Wozniak"
# "Konrad Zuse"
# "Sir Antony Hoare"
# "Marvin Minsky"
# "Yukihiro Matsumoto"
# "Hayyim Slonimski"
# "Gertrude Blanch"