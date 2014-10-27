# @cjsx React.DOM

React = require 'react'
Route = require '../lib/route'
Link = require '../lib/link'
ProjectTalkBoard = require './project-talk-board'
ProjectTalkBoardList = require './project-talk-board-list'
ProjectTalkThread = require './project-talk-thread'

boards = [
  {name: "General"}
  {name: "Science"}
  {name: "Help"}
]

ProjectTalk = React.createClass
  displayName: 'ProjectTalk'

  render: ->
    <div className="content-container talk">
      <Route path="/projects/:owner/:name/talk" handler={ProjectTalkBoardList} />
      <Route path="/projects/:owner/:name/talk/:board_name" handler={ProjectTalkBoard} />
      <Route path="/projects/:owner/:name/talk/:board_name/:thread_id" handler={ProjectTalkThread} />
    </div>

module?.exports = React.createClass
  displayName: "ProjectTalkPageContainer"

  render: ->
    <ProjectTalk owner={@props.route.params.owner} project={@props.route.params.name} />
