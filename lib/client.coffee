WsStream = require 'yws-stream'
Ws = require 'ws'

module.exports = ( url ) ->
  new WsStream ws : new Ws url 


