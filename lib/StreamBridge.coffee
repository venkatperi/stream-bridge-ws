{EventEmitter} = require 'events'
WsStream = require 'yws-stream'
Ws = require 'ws'
url = require 'url'

class StreamBridge extends EventEmitter
  constructor : ( opts = {} ) ->
    @init opts

  init : ( opts ) =>
    @server = new Ws.Server opts
    @server.on 'connection', @onConnection
    @server.on 'error', @onError

  onError : ( err ) =>
    @emit 'error', err

  onConnection : ( sock ) =>
    path = url.parse(sock.upgradeReq.url, true).path
    client = new WsStream ws : sock
    @emit 'ready', path, client
    @emit "ready:#{path}", client

module.exports = StreamBridge

