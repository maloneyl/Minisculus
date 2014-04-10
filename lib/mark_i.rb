class MarkI

  def initialize(wheel_setting)
    raise ArgumentError.new("Wheel setting must be within 0-9") if wheel_setting < 0 || wheel_setting > 9
    @wheel_setting = wheel_setting
  end

  def encrypt(input)
    keys = [
            "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
            "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
            "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
            "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
            ".", ",", "?", "!", "'", "\"", " "
           ]
    encrypted_input = ''
    input.each_char do |i|
      input_char_index = keys.index(i)
      index_shift = input_char_index + @wheel_setting
      if index_shift <= keys.length - 1
        encrypted_key = keys[index_shift]
      else
        encrypted_key = keys[index_shift - keys.length]
      end
      encrypted_input.concat(encrypted_key)
    end # returns 'input'
    encrypted_input
  end
end
