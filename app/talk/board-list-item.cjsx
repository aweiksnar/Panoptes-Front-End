# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: 'BoardListItem'

  render: ->
    <div>
      <h1>Board list item</h1>
      <p>This will be a talk board list item</p>
      <ul>
        <li>Board Title</li>
        <li>Description</li>
        <li>Author</li>
        <li>First Post</li>
        <li>Number of threads</li>
      </ul>
    </div>
