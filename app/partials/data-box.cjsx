# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: "DataBox"

  render: ->
    <div>
      <h2>{@props.title}</h2>
      <ul>
        <li>Value: {@props.activeItem.value}</li>
      </ul>
    </div>

    
