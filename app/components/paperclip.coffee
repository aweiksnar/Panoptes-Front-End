# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: "Paperclip"

  render: ->
    <div className="paperclip">
      <i className="paperclip-icon fa fa-comments fa-2x"></i>
      3
    </div>
