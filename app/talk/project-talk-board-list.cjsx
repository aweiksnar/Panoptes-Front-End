# @cjsx React.DOM

React = require 'react'
Route = require '../lib/route'
Link = require '../lib/link'

boards = [
  {name: "General"}
  {name: "Science"}
  {name: "Help"}
]

module?.exports = React.createClass
  displayName: 'ProjectTalkBoardList'

  boardLinkHref: (boardName) ->
    {owner, name} = @props.route.params
    '/projects/' + owner + "/" + name + '/talk/' + boardName

  linkToBoard: (board, i) ->
    <Link key={i} href={@boardLinkHref(board.name)}>{board.name}</Link>

  render: ->
    boardLinks = boards.map(@linkToBoard)

    <div>
      <h1>{@props.project} Talk Boards</h1>
      {boardLinks}
    </div>
