class String

  def colour(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colour(31)
  end

  def green
    colour(32)
  end
  
end