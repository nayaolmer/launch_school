
class TextAnalyzer

  def initialize(text)
    @text = text
  end


  def process
    if block_given?
      puts yield(@text)
    else
      return
    end
  end
end

analyzer = TextAnalyzer.new(File.open('sample_text.txt').read)
analyzer.process {|input_text| "#{input_text.split("\n\n").size} paragraphs" }
analyzer.process {|input_text| "#{input_text.split("\n").size} lines" }
analyzer.process {|input_text| "#{input_text.split(" ").size} words" }



# 3 paragraphs
# 15 lines
# 126 words