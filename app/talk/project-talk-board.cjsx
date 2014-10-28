# @cjsx React.DOM

React = require 'react'
Link = require '../lib/link'
Loader = require '../components/loading-indicator'

module?.exports = React.createClass
  displayName: "ProjectTalkBoard"

  componentDidMount: ->
    console.log "@props of ProjectTalkBoard", @props

  postLink: (id) ->
    {owner, name, board_name} = @props.route.params
    '/projects/' + owner + '/' + name + '/talk/' + board_name + '/' + id

  post: (data, i) ->
    <div key={i} className="talk-item">
      <Link href={@postLink(data.id)}>{data.name}</Link>
      <p>by: {data.user}</p>
    </div>

  posts: ->
    boardName = @props.route.params.board_name
    if @props.boards # TODO: This'll be new query in prod
      @props.boards.filter((b) -> b.name is boardName)[0].posts.map(@post)
    else
      <Loader />

  render: ->
    posts = @posts()

    <div>
      <h1>{@props.route.params.board_name} Board</h1>
      {posts}
    </div>
