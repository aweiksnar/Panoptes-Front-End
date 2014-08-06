# @cjsx React.DOM

React = require 'react'
FillChartItem = require './fill-chart-item'

module?.exports = React.createClass
  displayName: 'FillChart'

  render: ->
    data = for item, i in @props.data
      new FillChartItem i: i, r: 20, fill: (200 / item)

    <div>
     <h2>Fill chart</h2>
     <svg>
       {data}
     </svg>
    </div>

