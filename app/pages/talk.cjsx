# @cjsx React.DOM

React = require 'react'
BoardListItem = require '../talk/board-list-item'

module?.exports = React.createClass
  displayName: 'TalkPage'

  boardListItem: ->
    <BoardListItem />

  render: ->
    boardList = [1,2,3].map(@boardListItem)
    <div>
      <h1>{@props.project.name} Talk</h1>
      <p>Welcome to the {@props.project.name} discussion</p>
      {boardList}
    </div>
