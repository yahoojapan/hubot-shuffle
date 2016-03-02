# Description:
#  shuffle comma separated string, pick LT speeker, build team for lunch
#
# Commands:
#   hubot shuffle <comma separated string>
#   hubot pick <num> from <comma separated string>
#   hubot build <num> teams from <comma separated string>
#
# Author:
#   Tatsuro Mitsuno <tmitsuno@yahoo-corp.jp>

module.exports = (robot) ->

  # [NOTE] use 'http://bost.ocks.org/mike/shuffle/' as a reference.
  shuffle = (array) ->
    m = array.length

    while m
      i = Math.floor(Math.random() * m--)
      [array[m], array[i]] = [array[i], array[m]]
    array

  robot.respond /shuffle (\S+)$/i, (msg) ->
    msg.send (shuffle msg.match[1].split  ',').join ','

  robot.respond /pick (\d+) from (\S+)$/i, (msg) ->
    shuffled = shuffle msg.match[2].split  ','
    msg.send (shuffled.slice 0, msg.match[1]).join ','

  robot.respond /build (\d+) teams from (\S+)$/i, (msg) ->
    shuffled = shuffle msg.match[2].split  ','

    i = msg.match[1]
    member = Math.ceil shuffled.length / i
    while i-- isnt 0
      msg.send (shuffled.splice 0, member).join ','

