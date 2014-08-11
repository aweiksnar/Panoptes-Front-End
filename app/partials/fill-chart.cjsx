# @cjsx React.DOM

React = require 'react'
FillChartItem = require './fill-chart-item'
FillChartDataBox = require './fill-chart-data-box'

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

  numberOfRows: ->
    Math.ceil (@props.data.length / @props.rowSize)

  colHeight: ->
    (@numberOfRows() * @props.itemDiameter) + (@props.gap * (@numberOfRows() - 1))

  radius: -> @props.itemDiameter / 2

  render: ->
    fillChartItems = for item, i in @props.data
      new FillChartItem
        i: i,
        r: @radius(),
        fill: @scaledDataItem(item)
        gap: 4
        rowSize: @props.rowSize
        color:
          r: 0
          g: 0
          b: 0

    <div>
     <h2>Fill chart</h2>
     <svg width={@rowWidth()} height={@colHeight()}>
       {fillChartItems}
     </svg>
     <FillChartDataBox null/>
    </div>

