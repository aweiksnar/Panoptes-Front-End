# @cjsx React.DOM

React = require 'react'

# TODO: move all these max/min/normalizer/width/position functions
# shared with bar-graph to some type of graph-helpers mixin

module?.exports = React.createClass
  displayName: 'LineGraph'

  componentDidMount: ->
    console.log "line graph", @props.data
    console.log "notmaleized", @normalizedValues()
    console.log "coords", @coordPairs()

  dataValues: ->
    @props.data.map (d) -> d.classification_count

  dataMax: ->
    Math.max @dataValues()...

  dataMin: ->
    Math.min @dataValues()...

  itemPercentWidth: ->
    ((1 / @props.data.length) * (100 - @props.gap)) - @props.gap

  xPercentPosition: (i) ->
    (@itemPercentWidth() * i) + (@props.gap * (i + 1))

  normalizedValues: ->
    max = @dataMax()
    min = @dataMin()
    length = @props.data.length

    @dataValues().map (d) -> d / (max - min)

  coordNotUndefined: (c) ->
    c.x? and c.y?

  coords: ->
    normalizedValues = @normalizedValues()
    normalizedValues
      .map (n, i) => {x: @xPercentPosition(i), y: normalizedValues[i + 1]}
      .filter(@coordNotUndefined)

  coordPairNotUndefined: (c) ->
    c.coord1?.x? and c.coord2?.y? and c.coord1?.x? and c.coord2?.y?

  coordPairs: ->
    coords = @coords()
    coords
      .map (c, i) -> {coord1: c, coord2: coords[i + 1]}
      .filter(@coordPairNotUndefined)

  line: (p, i) ->
    <line
      x1={p.coord1.x + "%"}
      y1={(p.coord1.y * 100) + "%"}
      x2={p.coord2.x + "%"}
      y2={(p.coord2.y * 100) + "%"}
      stroke="black"
      stroke-width="1px"
    />

  circle: (d) ->
    <circle
      cx={d.x + "%"}
      cy={(d.y * 100) + "%"}
      r={@props.pointRadius}
      fill="red"
    />

  render: ->
    lines = @coordPairs().map(@line)
    circles = @coords().map(@circle)

    <div>
      <svg width="100%" height={@props.height}>
        <g transform="scale(1,-1), translate(0, -#{@props.height})">
          <line x1={0} y1={0} x2={0} y2={@props.height} stroke="black" stroke-width="1px"/>
          <g>{lines}</g>
          <g>{circles}</g>
          <line x1={0} y1={0} x2="100%" y2={0} stroke="black" stroke-width="1px"/>
        </g>
      </svg>
    </div>
