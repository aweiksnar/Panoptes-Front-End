# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: "FillChartDataBox"

  render: ->
    <div className="fill-chart-data-box">
      <h2>Fill Chart Data Box</h2>
      <ul>
        <li>
            Classification Count: {@props.activeItem.classification_count}
            <br />
            Date: {@props.activeItem.date}
        </li>
      </ul>
    </div>

