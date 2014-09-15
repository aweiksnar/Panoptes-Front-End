# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: 'PostView'

  render: ->
    <div>
      <h1>Post View</h1>
      <h2>Title / Author</h2>
      <ul>
        <li>Subject image</li>
        <li>Comments....</li>
        <li>Form for new comment</li>
      </ul>
    </div>
