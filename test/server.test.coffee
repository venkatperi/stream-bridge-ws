should = require 'should'
assert = require 'assert'
StreamBridge = require '..'

CLIENT_MSG = 'Remember when you were young, you shone like the sun.'
SERVER_MSG = 'Come on you raver, you seer of visions, come on you ' +
  'painter, you piper, you prisoner, and shine!'

describe 'server', ->

  bridge = null
  port = 9876
  path = '/test'

  before ->

  after ->

  beforeEach ->
    bridge = new StreamBridge port : port

  afterEach ->

  it 'stream', ( done ) ->
    bridge.on "ready:#{path}", ( stream ) ->
      stream.on 'data', ( x ) ->
        assert x.toString() is CLIENT_MSG
        done()
      stream.write SERVER_MSG

    client = StreamBridge.client "ws://localhost:#{port}#{path}"
    .on 'data', ( x ) ->
      assert x.toString() is SERVER_MSG
      client.write CLIENT_MSG
      
      
    
    
