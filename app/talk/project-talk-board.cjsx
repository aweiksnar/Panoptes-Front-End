# @cjsx React.DOM

React = require 'react'
Link = require '../lib/link'

module?.exports = React.createClass
  displayName: "ProjectTalkBoard"

  componentDidMount: ->
    console.log "@props of ProjectTalkBoard", @props

  postLink: (id) ->
    {owner, name, board_name} = @props.route.params
    '/projects/' + owner + '/' + name + '/talk/' + board_name + '/' + id

  post: (data, i) ->
    <Link key={i} href={@postLink(data.id)}>{data.name}</Link>

  posts: ->
    boardName = @props.route.params.board_name
    if @props.boards
      @props.boards.filter((b) -> b.name is boardName)[0].posts.map(@post)
    else
      "loading posts"

  render: ->
    posts = @posts()

    <div>
      <h1>{@props.route.params.board_name} Board</h1>
      {posts}
    </div>
