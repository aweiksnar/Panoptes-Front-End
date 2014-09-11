React = require 'react'

module?.exports = React.createClass
  displayName: 'HoverBox'

  render: ->
    <div style={display: @props.display, position: 'fixed', top: @props.top, left: @props.left, background: "grey"}>
      <p>{@props.content}</p>
    </div>
