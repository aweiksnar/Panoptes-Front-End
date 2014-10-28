# @cjsx React.DOM

React = require 'react'
Route = require '../lib/route'
Link = require '../lib/link'
talkBoards = require '../data/talkBoards'

boards = [
  {name: "General"}
  {name: "Science"}
  {name: "Help"}
]

module?.exports = React.createClass
  displayName: 'ProjectTalkBoardList'

  getInitialState: ->
    boards: null

  componentWillMount: ->
    @fetchBoards()

  fetchBoards: (q) ->
    talkBoards.fetch(q).then (talkBoards) =>
      @setState boards: talkBoards
      console.log "@state", @state

  boardLinkHref: (boardName) ->
    {owner, name} = @props.route.params
    '/projects/' + owner + "/" + name + '/talk/' + boardName

  linkToBoard: (board, i) ->
    <Link key={i} href={@boardLinkHref(board.name)}>{board.name}</Link>

  render: ->
    boardLinks = @state.boards.map(@linkToBoard) if @state.boards

    <div>
      <h1>{@props.project} Talk Boards</h1>
      {boardLinks}

    </div>
