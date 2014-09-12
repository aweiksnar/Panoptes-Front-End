# @cjsx React.DOM

React = require 'react'
HoverBox = require './hover-box'

# TODO: move all these max/min/normalizer/width/position functions
# shared with bar-graph to some type of graph-helpers mixin
# make ticks / labels / lines their own components

# there should be a fn that does something like
# @[prop] = -> data.map (d) -> d.prop
# seems like a common pattern

module?.exports = React.createClass
  displayName: 'LineGraph'

  componentDidMount: ->
    console.log "line graph mounted"
    console.log "@props", @props

  getInitialState: ->
    circleHover: {x: 0, y: 0, display: "none"}

  dataValues: ->
    @props.data.map (d) => d[@props.y.key]

  xAxisLabels: ->
    # [first, middle, last] x-labels
    dataLength = @props.data.length
    [@props.data[0][@props.x.key], @props.data[Math.round(dataLength / 2)][@props.x.key], @props.data[dataLength - 1][@props.x.key]
    ]

  dataMax: ->
    Math.max @dataValues()...

  indexOf: (elem) ->
    (elem while elem = elem.previousSibling).length

  itemPercentWidth: ->
    ((1 / @props.data.length) * (100 - @props.gap)) - @props.gap

  xPercentPosition: (i) ->
    (@itemPercentWidth() * i) + (@props.gap * (i + 1))

  yPercentPosition: (val) ->
    # make sure all y values display as tall as the circle radius
    # but not taller than the top of the graph
    (val - (@diaP() * val)) + @radP()

  normalizedValues: ->
    max = @dataMax()
 
    @dataValues().map (d) -> d / max

  coordNotUndefined: (c) ->
    c.x and c.y

  coords: ->
    # [{x, y}, ...] as percent values
    normalizedValues = @normalizedValues()
    normalizedValues
      .map (n, i) => {x: @xPercentPosition(i), y: @yPercentPosition(normalizedValues[i])}
      .filter(@coordNotUndefined)

  coordPairNotUndefined: (c) ->
    c.coord1?.x and c.coord2?.y and c.coord1?.x and c.coord2?.y

  radP: -> # percent
    (@props.pointRadius / @props.height) || 0

  diaP: -> # percent
    @radP() * 2

  coordPairs: ->
    # [{coord1: {x, y}, coord2: {x, y}}, ...]
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

  onCircleHover: (e) ->
   value = @props.data[@indexOf(e.target)][@props.y.key]
   offset = 5
   @setState {circleHover: {x: e.clientX + offset, y: e.clientY + offset, content: "#{value} #{@props.y.label}"}}

  onCircleMouseout: (e) ->
    @setState {circleHover: {display: "none"}}

  circle: (d) ->
    <circle
      cx={d.x + "%"}
      cy={(d.y * 100) + "%"}
      r={@props.pointRadius}
      fill="darkgrey"
      onMouseOver={@onCircleHover}
      onMouseOut={@onCircleMouseout}
    />

  yAxisLine: (n) ->
    <line
      x1={0}
      x2={100 + "%"}
      y1={@props.height * (n / @props.yLines)}
      y2={@props.height * (n / @props.yLines)}
      stroke="lightgrey"
      style={zIndex: -1}
    />

  xAxisTick: (xVal) ->
    <line
      x1={xVal + "%"}
      x2={xVal + "%"}
      y1={0}
      y2={10}
      stroke="lightgrey"
      style={zIndex: -1}
    />

  xLabelTextAnchor: (i) ->
    switch i
      when 0 then 'start'
      when (@xAxisLabels().length - 1) then 'end'
      else 'middle'

  xAxisLabel: (date, i) ->
    <text x={((i / 2) * 100) + "%"} y={20} style={textAnchor: @xLabelTextAnchor(i)} fill="darkgrey" stroke-width={1}>{date}</text>

  render: ->
    coords = @coords()
    lines = @coordPairs().map(@line)
    circles = coords.map(@circle)
    yAxisLines = [1..@props.yLines].map(@yAxisLine)
    xAxisTicks = coords.map((c) -> c.x).map(@xAxisTick)
    labels = @xAxisLabels().map(@xAxisLabel)

    <div className='line-graph'>
      <svg width="100%" height={@props.height}>
        <g transform="scale(1,-1), translate(0, -#{@props.height})">
          <line x1={0} y1={0} x2={0} y2={@props.height} stroke="black" stroke-width="1px"/>
          <g>{yAxisLines}</g>
          <g>{xAxisTicks}</g>
          <g>{lines}</g>
          <g>{circles}</g>
          <line x1={0} y1={0} x2="100%" y2={0} stroke="black" stroke-width="1px"/>
        </g>
      </svg>
      <svg width="100%" height={20}><g>{labels}</g></svg>

      <HoverBox display={@state.circleHover.display} top={@state.circleHover.y} left={@state.circleHover.x} content={@state.circleHover.content}/>
    </div>
