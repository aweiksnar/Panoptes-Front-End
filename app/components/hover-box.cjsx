React = require 'react'

module?.exports = React.createClass
  displayName: 'HoverBox'

  render: ->
    <div className='hover-box' style={display: @props.display, position: 'fixed', top: @props.top, left: @props.left, background: "darkgrey"}>
      <p>{@props.content}</p>
    </div>
