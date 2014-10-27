# @cjsx React.DOM

React = require 'react'
Link = require '../lib/link'

TALK_BOARDS =
  general:
    posts: [
      {id: 1, name: "General Post"}
      {id: 2, name: "Another General Post"}
      {id: 3, name: "MORE......."}
      ]
  science:
    posts: [
      {id: 4, name: "Science Post"}
      {id: 6, name: "Another Science Post"}
      {id: 9, name: "MORE......."}
      ]

  help:
    posts: [
      {id: 10, name: "HALP!!"}
      {id: 11, name: "Another Help Post"}
      {id: 12, name: "MORE......."}
      ]

module?.exports = React.createClass
  displayName: "ProjectTalkBoard"

  componentDidMount: ->
    console.log "@props of ProjectTalkBoard", @props

  postLink: (id) ->
    {owner, name, board_name} = @props.route.params
    '/projects/' + owner + '/' + name + '/talk/' + board_name + '/' + id

  post: (data, i) ->
    <Link key={i} href={@postLink(data.id)}>{data.name}</Link>

  render: ->
    boardName = @props.route.params.board_name
    posts = TALK_BOARDS[boardName.toLowerCase()].posts.map(@post)

    <div>
      <h1>{@props.route.params.board_name} Board</h1>
      {posts}
    </div>
