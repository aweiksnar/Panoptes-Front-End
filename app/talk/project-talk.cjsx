# @cjsx React.DOM

React = require 'react'
Route = require '../lib/route'
Link = require '../lib/link'
ProjectTalkBoard = require './project-talk-board'
ProjectTalkBoardList = require './project-talk-board-list'
ProjectTalkThread = require './project-talk-thread'
talkBoards = require '../data/talkBoards'

ProjectTalk = React.createClass
  displayName: 'ProjectTalk'

  getInitialState: ->
    boards: null

  componentWillMount: ->
    @fetchBoards()

  fetchBoards: (q) ->
    talkBoards.fetch(q).then (talkBoards) =>
      @setState boards: talkBoards
      console.log "@state", @state

  render: ->
    <div className="content-container talk project-text-content">
      <Route path="/projects/:owner/:name/talk" handler={ProjectTalkBoardList} boards={@state.boards}/>
      <Route path="/projects/:owner/:name/talk/:board_name" handler={ProjectTalkBoard} boards={@state.boards}/>
      <Route path="/projects/:owner/:name/talk/:board_name/:thread_id" handler={ProjectTalkThread} boards={@state.boards}/>
    </div>

module?.exports = React.createClass
  displayName: "ProjectTalkPageContainer"

  render: ->
    <ProjectTalk owner={@props.route.params.owner} project={@props.route.params.name} />
