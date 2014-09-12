# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: "DataBox"

  render: ->
    <div className="data-box">
      <h2>{@props.title}</h2>
      <ul>
        <li>{@props.activeItem[@props.y.key]} {@props.y.label}</li>
        <li>{@props.x.label} {@props.activeItem[@props.x.key]}</li>
      </ul>
    </div>

    
