module FormatHelper
  def format_price(price)
    if price.to_s.split(".")[1].length == 1
      return price.to_s << "0"
    else
      return price.to_s
    end
  end

  def format_phone(num)
    "(#{num.slice(0,3)})#{num.slice(3,3)}-#{num.slice(6,4)}"
  end

end
