# ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]

class XmlBuilder
  def build(&block)
    @data = '<xml>'
    block.call if block_given?
    @data += '</xml>'
  end

  def method_missing(name, *args, &block)
    @data += "<#{name}>"
    @data += args[0] if args[0]
    block.call if block_given?
    @data += "</#{name}>"
  end
end

xml = XmlBuilder.new
xml.build {
  xml.coder {
    xml.name 'Matz'
    xml.language 'Ruby'
  }
  xml.coder {
    xml.name 'Ming'
    xml.language 'TODO'
  }
}.tap { |xml| puts xml }
