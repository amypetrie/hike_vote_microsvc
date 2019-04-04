class Processor

  def self.push(raw_post)
    parsed = JSON.parse(raw_post)
    req = conn.post("/hikes"), parsed
  end

  private

    def conn
      Faraday.new(url: "https://hiking-trails-challenge.herokuapp.com/") do |f|
        f.adapter Faraday.default_adapter
      end
    end

end
