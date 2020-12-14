# frozen_string_literal: true

require 'rest-client'
require 'nokogiri'
require 'faraday'

module Compliment
  URL = 'http://kompli.me/%ef%bb%bfkomplimenty-devushke'
  URL2 = 'http://kompli.me/%ef%bb%bfkomplimenty-devushke/page/2'
  URL3 = 'http://kompli.me/%ef%bb%bfkomplimenty-devushke/page/3'

  ARRAY_TEXT_GIRL = []

  def compliment_girl(url)
    page = Faraday.get url
    page = page.body
    nokogiri_object = Nokogiri.HTML(page)
    nokogiri_object.css('.post-card__title a').each { |tag| ARRAY_TEXT_GIRL << tag.text }
  end
end
