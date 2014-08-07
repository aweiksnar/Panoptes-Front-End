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

  render: ->
    fillChartItems = for item, i in @props.data
      new FillChartItem
        i: i,
        r: 20,
        fill: @scaledDataItem(item)
        gap: 4
        rowSize: 7

    <div>
     <h2>Fill chart</h2>
     <svg width={fillChartItems.length * 40}>
       {fillChartItems}
     </svg>
    </div>

