class Company
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def release_new_product(name)
    product = Object.const_set(name.capitalize, Class.new)
    company = self
    product.class_eval do
      attr_accessor :model_name, :company, :serial_number

      define_method :initialize do |serial_number|
        @model_name = name
        @company = company
        @serial_number = serial_number
      end
    end
  end
end

apple = Company.new('apple')
apple.release_new_product('iPhoneX')

my_iphone = Iphonex.new('0123456789')
puts my_iphone.inspect
# <Iphonex:0x00005590839bd200 @model_name="iPhoneX", @company=#<Company:0x00005590839bda48 @name="apple">, @serial_number="0123456789">

apple.release_new_product('iPhone5')
your_iphone = Iphone5.new('20210220')
puts your_iphone.inspect
#<Iphone5:0x000055b7114d0288 @model_name="iPhone5", @company=#<Company:0x000055b7114d13e0 @name="apple">, @serial_number="20210220">
