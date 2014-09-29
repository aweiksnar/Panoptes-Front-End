# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: 'CommentView'

  render: ->
    <div className='comment-view'>
      <p>by: <strong>{@props.data.author}</strong></p>
      <p>{@props.data.message}</p>
      <p>reply</p>
    </div>
