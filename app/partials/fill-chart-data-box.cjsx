# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: "FillChartDataBox"

  componentDidMount: ->
    console.log @props.activeItem, "data box mounted"

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

