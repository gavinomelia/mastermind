require_relative 'pin'

class CodeMaker
  def set_code(code = [])
    return code if code.length == 4

    4.times do
      code << Pin.new
    end
    code
  end
end