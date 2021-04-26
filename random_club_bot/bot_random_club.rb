# frozen_string_literal: true

require './random_club.rb'
require 'telegram/bot'
require 'dotenv/load'

Dotenv.load('TOKEN.env')
COMANDS = {
  start: '/start', help: '/help', group: '/group', club: '/club'
}.freeze

Telegram::Bot::Client.run(ENV['TOKEN']) do |bot|
  bot.listen do |message|
    case message.text
    when COMANDS[:start]
      bot.api.send_message(chat_id: message.chat.id, text: "Привіт, #{message.from.last_name} сьогодні день фіфа.
        Для отримання рандомної команди набери /group а далі /club")
    when COMANDS[:group]
      text = random_group
      bot.api.send_message(chat_id: message.chat.id, text: "Твоя група, #{text[0]}, #{text[1]}, #{text[2]}
        Набери /club ")
    when COMANDS[:club]
        bot.api.send_message(chat_id: message.chat.id, text: "Твоя команда #{@club_random.sample}")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "Немає такої команди. #{COMANDS[:start]} - старт боту,
#{COMANDS[:group]} - вибір рандомної групи")
    end
  end
end
