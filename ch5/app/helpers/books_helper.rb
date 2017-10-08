module BooksHelper
  def show_price(price)
    if price
      "$ #{price * 1.0 / 100 }"
    end
  end
end
