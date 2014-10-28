# @cjsx React.DOM

React = require 'react'
Loader = require '../components/loading-indicator'

module?.exports = React.createClass
  displayName: "ProjectTalkThread"

  comment: (c, i) ->
    <div key={i} className="talk-item">
      <strong>{c.user} - {c.date}</strong>
      <p>{c.content}</p>
    </div>

  post: ->
    boardName = @props.route.params.board_name
    if @props.boards # TODO: This'll be new query in prod
      @props.boards.filter((b) => b.name is boardName)[0].posts.filter((p) => p.id is +@props.route.params.thread_id)[0]
    else
      <Loader />

  render: ->
    post = @post()
    <div>
      <h1>{post.name}</h1>
      <img src={post.location} />
      {post.comments.map(@comment) if @props.boards}
    </div>
