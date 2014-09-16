# @cjsx React.DOM

React = require 'react'
BoardListItem = require '../talk/board-list-item'
Route = require '../lib/route'

FAKE_BOARD_DATA = [
  {
    board_name: "Main",
    description: "For general discussion"
    last_post:
      author: "sirpostsalot"
      title: "Hey everyone, let's have a general discussion"
      date: "8/13/1989"
  },
  {
    board_name: "Science"
    description: "Post questions about the science goals of the project"
    last_post:
      author: "carrot top"
      title: "How to be a citizen scientist grandmaster"
      date: "8/13/1989"
  },
  {
    board_name: "Help"
    description: "Post any questions about the way things work"
    last_post:
      author: "classifier bot 5000"
      title: "Honey I shrunk the classifier page"
      date: "8/13/1989"
  }
]

module?.exports = React.createClass
  displayName: 'TalkPage'

  boardListItem: (board) ->
    <BoardListItem project={@props.project} board={board}/>

  render: ->
    boardList = FAKE_BOARD_DATA.map(@boardListItem)
    <div className='talk-page'>
      <h1>{@props.project.name} Talk</h1>
      <p>Welcome to the {@props.project.name} discussion</p>
      {boardList}
    </div>

