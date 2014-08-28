# @cjsx React.DOM

# expects an object (make this a props validator thing later)

React = require 'react'

StatsItem = require './stats-item'

module?.exports = React.createClass
  displayName: 'StatsBox'

  propTypes:
    data: React.PropTypes.object

  render: ->
    statsItems = @dataKeyValues().map (obj) ->
      <StatsItem header={obj.v} label={obj.k} />

    <div className="stats-box">
      <h2>{@props.title}</h2>
      <div className="stats-items">
        {statsItems}
      </div>
    </div>

  dataKeyValues: ->
    {k: k, v: v} for own k, v of @props.data
      
