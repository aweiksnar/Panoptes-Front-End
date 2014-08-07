# @cjsx React.DOM

React = require 'react'
FillChartItem = require './fill-chart-item'

module?.exports = React.createClass
  displayName: 'FillChart'

  dataMax: ->
    Math.max @props.data...

  dataMin: ->
    Math.min @props.data...

  scaledDataItem: (item)->
    (item - @dataMin()) / (@dataMax() - @dataMin())

  rowWidth: ->
    (@props.rowSize * @props.itemDiameter) + ((@props.rowSize - 1) * @props.gap)

  numberOfCols: ->
    Math.floor (@props.data.length / @props.rowSize)

  colHeight: ->
    (@numberOfCols() * @props.itemDiameter) + (@props.gap * (@numberOfCols() - 1))

  render: ->
    fillChartItems = for item, i in @props.data
      new FillChartItem
        i: i,
        r: 20,
        fill: @scaledDataItem(item)
        gap: 4
        rowSize: @props.rowSize

    <div>
     <h2>Fill chart</h2>
     <svg width={@rowWidth()} height={@colHeight()}>
       {fillChartItems}
     </svg>
    </div>

