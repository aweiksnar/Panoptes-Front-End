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

  itemWidth: ->
    @props.width / @dataLength()

  xPosition: (i) ->
    @itemWidth() * i + (@props.gap * (i + 1))

  graphWidth: ->
    @itemWidth() * @dataLength() + (@props.gap * @dataLength()) + @props.gap

  normalizedValues: ->
    max = @dataMax()
    min = @dataMin()
    length = @dataLength()

    @props.data.map (d) ->
      d.value / (max - min)

  percentageValues: ->
    @normalizedValues().map (v) -> v * 100

  activeItemData: ->
    @props.data[@state.activeItem]

  itemIndex: (child) ->
    i = 0
    i++ while child = child.previousSibling
    i

  onBarMouseOver: (e) ->
    @setState activeItem: @itemIndex(e.target)

  render: ->
    percentages = @percentageValues()
    normalizedValues = @normalizedValues()

    bars = for item, i in @props.data
      <rect width={@itemWidth()} height={percentages[i] + "%"} x={@xPosition(i)} fill={@props.color} opacity={normalizedValues[i]} onMouseOver={@onBarMouseOver} />

    <div>
      <h2>Bar Graph</h2>
      <svg width={@graphWidth()} height={@props.height}>
        <g transform="scale(1,-1), translate(0, -#{@props.height})">
          <line x1={0} y1={0} x2={0} y2={@props.height} stroke="black" stroke-width="1px" />
          <g>{bars}</g>
          <line x1={0} y1={0} x2={@graphWidth()} y2={0} stroke="black" stroke-width="1px"/>
        </g>
      </svg>
      <DataBox title="Bar Graph Data Box" activeItem={@activeItemData()} />
    </div>
