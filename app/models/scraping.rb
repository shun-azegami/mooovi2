class Scraping

  def link
    agent = Mechanize.new
    current_page = agent.get("http://review-movie.herokuapp.com/")
    elements = current_page.search('.entry-title a').each do |ele|
    
    link = []
    end
  end

  def product
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.entry-title').inner_text
    image_url = page.at('.entry-content img')[:src]
    director = page.at('.director span').inner_text
    detail = page.at('.entry-content p'),inner_text
    open_date = page.at('.date span').inner_text

    product = Product.new(title: title, image_url: image_url, director: director, detail: detail, open_date: open_date)
    product.save
  end

end