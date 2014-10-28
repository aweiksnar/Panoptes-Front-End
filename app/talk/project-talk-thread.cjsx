# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: "ProjectTalkThread"

  post: ->
    boardName = @props.route.params.board_name
    if @props.boards
      @props.boards.filter((b) => b.name is boardName)[0].posts.filter((p) => p.id is +@props.route.params.thread_id)[0]
    else
      "loading..."

  render: ->
    post = @post()
    <h1>{post.name}</h1>


