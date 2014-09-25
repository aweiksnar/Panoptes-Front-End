# @cjsx React.DOM

React = require 'react'
Link = require '../lib/link'
BoardView = require './board-view'
Route = require '../lib/route'

module?.exports = React.createClass
  displayName: 'BoardListItem'

  render: ->
    <div className='board-list-item'>
      <Link href="/projects/#{@props.project.owner_name}/#{@props.project.name}/talkboard">
        <h1>{@props.board.board_name} Board</h1>
      </Link>
      <p>{@props.board.description}</p>
      <p>
        Last post by: <strong>{@props.board.last_post.author} </strong>
        <a style={textDecoration: "underline"}>{@props.board.last_post.title}</a>
        <span> {@props.board.last_post.date}</span>
      </p>
    </div>
