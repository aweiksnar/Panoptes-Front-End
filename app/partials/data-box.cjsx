# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: "DataBox"

  render: ->
    <div className="data-box">
      <h2>{@props.title}</h2>
      <ul>
        <li>Label: {@props.activeItem.label}</li>
        <li>Value: {@props.activeItem.value}</li>
      </ul>
    </div>

    
