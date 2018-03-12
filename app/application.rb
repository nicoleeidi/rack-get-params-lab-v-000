class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    end
      if req.path.match(/cart/) #this would mean to do it everytime its in the path.
        if !@@cart.empty?
          @@cart.each do |item|
          resp.write "#{item}\n"
        end
      else
        resp.write "Your cart is empty"
          #empty cart messge
      end
    end
    if req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/add/)
      search_term = req.params["item"]
      
        @@cart << search_term @@items.include?(item)
        

    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
