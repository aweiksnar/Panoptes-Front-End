# @cjsx React.DOM

React = require 'react'
FillChart = require '../components/fill-chart'

FAKE_DATA = [5,2,6,7,3,1,7,8,4,5,5,4]

module?.exports = React.createClass
  displayName: 'Dashboard'

  componentDidMount: ->
    console.log "props", @props.project.name

  render: ->
    console.log "staterender", FAKE_DATA
    <div className="dashboard">
      <h1>Project Dashboard: {@props.project.name}</h1>
      <FillChart data={FAKE_DATA}/>
    </div>
