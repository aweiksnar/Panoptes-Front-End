# @cjsx React.DOM

React = require 'react'
Link = require '../lib/link'

module?.exports = React.createClass
  displayName: 'PostListItem'

  render: ->
    <div className='post-list-item'>
      <Link href="/projects/#{@props.project.owner_name}/#{@props.project.name}/talkpost">
        <h1>{@props.post.title}</h1>
      </Link>
        <p>by: <strong>{@props.post.author}</strong> {@props.post.postCount} comments, {@props.post.participants} participants</p>
    </div>

