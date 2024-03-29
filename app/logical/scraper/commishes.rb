# frozen_string_literal: true

module Scraper
  class Commishes < Base
    def initialize(artist_url)
      super
      @until = "99999999999999"
    end

    def self.state
      :until
    end

    def fetch_next_batch
      ids = get_ids_from_page("https://portfolio.commishes.com/user/#{api_identifier}.json?until=#{@until}")
      end_reached if @until.nil?
      get_details(ids)
    end

    def to_submission(submission)
      s = Submission.new
      s.identifier = submission[:identifier]
      s.title = submission[:title]
      s.description = ""
      s.created_at = DateTime.parse submission[:created_at]

      s.add_file({
        url: submission[:file_url],
        created_at: s.created_at,
        identifier: submission[:identifier],
      })
      s
    end

    def fetch_api_identifier
      response = fetch_json("https://portfolio.commishes.com/user/#{url_identifier}.json")
      response["user"]["id"]
    end

    private

    def get_ids_from_page(page)
      response = fetch_json(page, headers: headers)
      @until = response["until"]
      response["payload"].pluck("url")
    end

    def get_details(urls)
      urls.map do |url|
        html = fetch_html(url, headers: headers)
        script_containing_id = html.xpath("//script[contains(text(), '/upload/tag/')]").first
        original_image_id = script_containing_id.text.match(%r{/(\d+)/remove/})[1]
        {
          identifier: url.split("/").pop,
          title: html.at("h1#upload-title").content,
          description: "",
          created_at: html.at("h1#upload-title").parent.content.sub(/.*\u00a9.*(\d{4}) -/, '\1'),
          file_url: "https://portfolio.commishes.com/image/#{original_image_id}/original/",
        }
      end
    end

    def headers
      { Cookie: "PHPSESSID=#{fetch_cookie}" }
    end

    def fetch_cookie
      SeleniumWrapper.driver do |driver|
        driver.navigate.to "https://portfolio.commishes.com/account/login"

        driver.wait_for_element(css: "input[name='username']").send_keys Config.commishes_user
        driver.find_element(css: "input[name='password']").send_keys Config.commishes_pass
        driver.find_element(css: "input[id='login']").click

        driver.cookie_value("PHPSESSID")
      end
    end
    cache(:fetch_cookie, 2.weeks)
  end
end
