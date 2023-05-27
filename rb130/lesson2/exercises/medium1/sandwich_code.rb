






class TextAnalyzer

  def process
    file = File.open("sandwich_code.txt").read
    yield(file)
    file.close

  end

end


analyzer = TextAnalyzer.new

p analyzer.process { |input_file| input_file.split(/\n\n+/).count} ## Count paragraphs
p analyzer.process { |input_file| input_file.split(/\n+/).count }
p analyzer.process { |input_file| input_file.split(' ').count }