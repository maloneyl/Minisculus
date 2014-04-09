class MarkI

  def initialize(wheel_setting)
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
    new_input = ''
    input.each_char do |i|
      input_char_index = keys.index(i)
      new_key = keys[input_char_index + @wheel_setting] # ignore looping back to start for now
      new_input += new_key
    end
    new_input # otherwise, it's the original input that's returned
  end
end
