# frozen_string_literal: true
require 'telegram/bot'
require_relative 'compliment'
include Compliment
require 'dotenv/load'

Dotenv.load('TOKEN.env')
COMANDS = {
  start: '/start', stop: '/stop', help: '/help', compliment: '/comp'
}.freeze
puts COMANDS[:complimetn]
compliment_girl(URL)
compliment_girl(URL2)
compliment_girl(URL3)
text_help = <<-TEXT
Для начала общения #{COMANDS[:start]}
Для завершения #{COMANDS[:stop]}
Получить комплимент #{COMANDS[:compliment]}
TEXT

Telegram::Bot::Client.run(ENV['TOKEN']) do |bot|
  bot.listen do |message|
    case message.text
    when COMANDS[:start]
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when COMANDS[:stop]
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when COMANDS[:compliment]
      bot.api.send_message(chat_id: message.chat.id, text: "#{ARRAY_TEXT_GIRL.sample}")
    when COMANDS[:help]
      bot.api.send_message(chat_id: message.chat.id, text: text_help)
    else
      bot.api.send_message(chat_id: message.chat.id, text: "Нет такой команды. Введите /help для просмотра доступных команд")
    end
  end
end
