# @cjsx React.DOM

React = require 'react'
Route = require '../lib/route'
Link = require '../lib/link'
talkBoards = require '../data/talkBoards'
Loader = require '../components/loading-indicator'

module?.exports = React.createClass
  displayName: 'ProjectTalkBoardList'

  boardLinkHref: (boardName) ->
    {owner, name} = @props.route.params
    '/projects/' + owner + "/" + name + '/talk/' + boardName

  linkToBoard: (board, i) ->
    <div key={i} className="talk-item">
      <Link href={@boardLinkHref(board.name)}>{board.name}</Link>
      <p>{board.description}</p>
    </div>

  boards: ->
    if @props.boards # TODO: This'll be new query in prod
      @props.boards.map(@linkToBoard)
    else
      <Loader />

  render: ->
    boards = @boards()

    <div>
      <h1>{@props.project} Talk Boards</h1>
      {boards}
    </div>
