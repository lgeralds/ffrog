# 
#  format.rb
#  transcoder
#  
#  Created by lgeralds on 2011-02-18.
#  Copyright 2011 lgeralds. All rights reserved.
# 

class Format
  attr_accessor :__data

  def initialize(d)
    @__data = d || {}
  end
  
  def method_missing(name, *args)
    # puts "NAME: #{name}"
    # keys = name.to_s.split('_')
    # t = @data
    # 
    # keys.each do |key|
    #   puts "key: #{key}"
    #   puts "t: #{t}"
    #   if t.has_key? key
    #     t = t[key]
    #   elsif t.has_key? key.to_sym
    #     t = t[key.to_sym]
    #   else
    #     super
    #   end
    #   if t.
    # end
    # 
    # t
    if @__data.has_key? name
      @__data[name]
    elsif @__data.has_key? name.to_s
      @__data[name.to_s]
    else
      super
    end

  end
end
