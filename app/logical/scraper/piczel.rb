# frozen_string_literal: true

module Scraper
  class Piczel < Base
    def init
      @from_id = 999_999_999
    end

    def self.enabled?
      true
    end

    def fetch_next_batch
      url = "https://piczel.tv/api/users/#{url_identifier}/gallery?from_id=#{@from_id}"
      response = HTTParty.get(url)
      json = JSON.parse(response.body)
      @from_id = json.map { |e| e["id"] }.min
      end_reached if json.size != 32
      json
    end

    def to_submission(submission)
      s = Submission.new
      s.identifier = submission["id"]
      s.title = submission["title"]
      s.description = submission["description"]
      s.created_at = DateTime.parse submission["created_at"]

      s.add_file({
        url: submission["image"]["url"],
        created_at: s.created_at,
        identifier: submission["id"],
      })
      submission["images"]&.each do |entry|
        s.add_file({
          url: entry["image"]["url"],
          created_at: s.created_at,
          identifier: "plain_image#{entry['id']}",
        })
      end
      s
    end

    def fetch_api_identifier
      response = HTTParty.get("https://piczel.tv/api/users/#{url_identifier}?friendly=1")
      JSON.parse(response.body)["id"]
    end
  end
end
