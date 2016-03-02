assert = require 'power-assert'

Robot       = require "hubot/src/robot"
TextMessage = require("hubot/src/message").TextMessage;

path = require 'path'

describe 'shuffle', ->

  user = ''
  robot = ''

  beforeEach () ->
    robot = new Robot(null, 'mock-adapter', true, 'hubot');
    robot.adapter.on 'connected', ->
      robot.loadFile path.resolve('.', 'src'), 'index.coffee'

      user = robot.brain.userForId "1", {
        name: "mocha"
        room: "#mocha"
      }

    robot.run()

  afterEach () ->
    robot.server.close()
    robot.shutdown()


  context 'when call `shuffle` with args', ->

    it 'return shuffled array', (done) ->

      string = 'a,b,c,d,e'

      robot.adapter.on 'send', (envelope, strings) ->
        splited = string.split ','
        obj = strings[0].split ','
        assert.notDeepEqual obj       , splited
        assert.deepEqual    obj.sort(), splited
        done()

      robot.adapter.receive new TextMessage user, "hubot shuffle #{string}"

  context 'when call `pick` with args', ->    
    it 'return picked array', (done) ->

      string = 'a,b,c,d,e'

      robot.adapter.on 'send', (envelope, strings) ->
        obj = strings[0].split ','
        assert obj.length == 3
        done()

      robot.adapter.receive new TextMessage user, "hubot pick 3 from #{string}"

  context 'when call `build` with args', ->    
    context 'when member > team', ->
      it 'return teams', (done) ->

        string = 'a,b,c,d,e'
        count = 0
        expected=[3,2]

        robot.adapter.on 'send', (envelope, strings) ->
          obj = strings[0].split ','
          assert obj.length == expected[count]
          done() if ++count == 2


        robot.adapter.receive new TextMessage user, "hubot build 2 teams from #{string}"
    
    context 'when member < team', ->
      it 'return teams (include a team of no menber)', (done) ->

        string = 'a,b,c,d,e'
        count = 0
        expected=[1,1,1,1,1,0]

        robot.adapter.on 'send', (envelope, strings) ->
          obj = strings[0].split ','
          assert obj[0].length == expected[count]
          done() if ++count == 6

        robot.adapter.receive new TextMessage user, "hubot build 6 teams from #{string}"

