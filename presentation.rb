require "maruku"

# Borrow from showoff

class Slide
  attr_reader :classes, :text
  def initialize classes = ""
    @classes = ["content"] + classes.strip.chomp('>').split
    @text = ""
  end
  def <<(s)
    @text << s
    @text << "\n"
  end
  def empty?
    @text.strip == ""
  end
end

def get_slide_html
  process_markdown
end

def process_markdown

  content = File.read("presentation.md")
  
  lines = content.split("\n")
  
  slides = []
  slides << (slide = Slide.new)
  until lines.empty?
    line = lines.shift
    if line =~ /^<?!SLIDE(.*)>?/
      slides << (slide = Slide.new($1))
    else
      slide << line
    end
  end

  slides.delete_if {|slide| slide.empty? }
  
  final = ''
  
  if slides.size > 1
    seq = 1
  end
  
  slides.each do |slide|
    markdown_content = ''
    content_classes = slide.classes

    # extract transition, defaulting to none
    transition = 'none'
    content_classes.delete_if { |x| x =~ /^transition=(.+)/ && transition = $1 }
    # extract id, defaulting to none
    id = nil
    content_classes.delete_if { |x| x =~ /^#([\w-]+)/ && id = $1 }
  

    # create html

    markdown_content += "<article"
    markdown_content += " id=\"#{id}\"" if id
    markdown_content += " class=\"slide\" data-transition=\"#{transition}\">"
    if seq
      markdown_content += "<div class=\"#{content_classes.join(' ')}\" ref=\"#{seq.to_s}\">\n"
      seq += 1
    else
      markdown_content += "<div class=\"#{content_classes.join(' ')}\" ref=\"\">\n"
    end
    sl = Maruku.new(slide.text).to_html
   # sl = update_image_paths(name, sl, static, pdf)
    markdown_content += sl
    markdown_content += "</div>\n"
    markdown_content += "</article>\n"
   
    final += markdown_content
   
   # final += update_commandline_code(markdown_content)
   # final = update_p_classes(final)
  end
  final
end
