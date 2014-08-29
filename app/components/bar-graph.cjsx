# @cjsx React.DOM

React = require 'react'
DataBox = require "../partials/data-box"

module?.exports = React.createClass
  displayName: "BarGraph"

  getInitialState: ->
    activeItem: 0

  dataLength: ->
    @props.data.length

  dataValues: ->
    @props.data.map (d) -> d.value

  dataLabels: ->
    @props.data.map (d) -> d.label

  dataMax: ->
    Math.max @dataValues()...

  dataMin: ->
    Math.min @dataValues()...

  itemPercentWidth: ->
    ((1 / @dataLength()) * (100 - @props.gap)) - @props.gap

  xPercentPosition: (i) ->
    (@itemPercentWidth() * i) + (@props.gap * (i + 1))

  normalizedValues: ->
    max = @dataMax()
    min = @dataMin()
    length = @dataLength()

    @props.data.map (d) -> d.value / (max - min)

  activeItemData: ->
    @props.data[@state.activeItem]

  itemIndex: (child) ->
    i = 0
    i++ while child = child.previousSibling
    i

  onBarMouseOver: (e) ->
    @setState activeItem: @itemIndex(e.target)

  bar: (v, i) ->
    <rect
      width = {@itemPercentWidth() + "%"}
      height = {(v * 100) + "%"}
      x = {@xPercentPosition(i) + "%"}
      fill = {@props.color}
      opacity = {v}
      onMouseOver = {@onBarMouseOver}
    />

  render: ->
    bars = @normalizedValues().map(@bar)

    <div className="bar-graph">
      <h2>Bar Graph</h2>
      <svg width="100%" height={@props.height}>
        <g transform="scale(1,-1), translate(0, -#{@props.height})">
          <line x1={0} y1={0} x2={0} y2={@props.height} stroke="black" stroke-width="1px" />
          <g>{bars}</g>
          <line x1={0} y1={0} x2="100%" y2={0} stroke="black" stroke-width="1px"/>
        </g>
      </svg>
      <DataBox title="Bar Graph Data Box" activeItem={@activeItemData()} />
    </div>
