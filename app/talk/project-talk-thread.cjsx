# @cjsx React.DOM

React = require 'react'

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
  displayName: "ProjectTalkThread"

  render: ->
    boardName = @props.route.params.board_name
    post = TALK_BOARDS[boardName.toLowerCase()].posts.filter (p) =>
      p.id is +@props.route.params.thread_id
    
    <div>
      <h1>{post[0].name}</h1>
    </div>
