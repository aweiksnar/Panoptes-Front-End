# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: 'BoardView'

  render: ->
    <div>
      <p><- link back to talk view</p>
      <h1>Board View</h1>
      <ul>
        <li>List of options to sort by</li>
        <li>A bunch of posts</li>
      </ul>
    </div>
