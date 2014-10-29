# @cjsx React.DOM

React = require 'react'
Loader = require '../components/loading-indicator'
{dispatch} = require '../lib/dispatcher'
talkBoardsStore = require '../data/talkBoards'

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
      @props.boards
        .filter((board) => board.name is boardName)[0]
        .posts.filter((post) => post.id is +@props.route.params.thread_id)[0]
    else
      <Loader />

  onCommentSubmit: (e) ->
    e.preventDefault()
    comment = @refs.comment.getDOMNode().value.trim()

    dispatch 'talk-comment:submit', comment
    @refs.comment.getDOMNode().value = ''
    @forceUpdate()
    
  render: ->
    post = @post()

    <div>
      <h1>{post.name}</h1>
      <img src={post.location} />
      <form onSubmit={@onCommentSubmit}>
        <input placeholder="Say something..." ref="comment" />
      </form>
      {post.comments.map(@comment) if @props.boards}
    </div>
