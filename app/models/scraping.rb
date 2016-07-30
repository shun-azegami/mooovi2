class Scraping

  def self.movie_urls

    links = []
    agent = Mechanize.new
    current_page = agent.get("http://review-movie.herokuapp.com/" + next_url)
    elements = current_page.search('.entry-title a').each do |ele|
      links << ele[:href]
    end

    links.each do |link|
      get_product("http://review-movie.herokuapp.com/" + link)
    end

  end

  def self.get_product(link)

    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.entry-title').inner_text
    image_url = page.at('.entry-content img')[:src] if page.at('.entry-content img')
    director = page.at('.director span').inner_text
    detail = page.at('.entry-content p').inner_text
    open_date = page.at('.date span').inner_text

    product = Product.where(title: title, image_url: image_url).first_or_initialize
    product.save

  end

end