class Model
  constructor: (properties) ->
    @callbacks = []

    for key, value of properties
      @[key] = value

  listen: (callback) ->
    @callbacks.push callback

  stopListening: (callback) ->
    index = @callbacks.indexOf callback
    unless index is -1
      @callbacks.splice index, 1

  emitChange: ->
    for callback in @callbacks
      callback()

  apply: (fn) ->
    Promise.all([
      fn()
    ]).then @emitChange.bind this

module.exports = Model
