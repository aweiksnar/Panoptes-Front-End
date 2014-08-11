# @cjsx React.DOM

React = require 'react'
FillChart = require '../partials/fill-chart'

#FAKE_DATA = [5,2,6,7,3,1,7,8,4,5,5,4,3,5,7,8,3,2,6,8,9,3,4,5,2,5,2,10,3,7]

PROJECT_CLASSIFICATION_DATA = [
  {classification_count: 5, date: "08/13/2014"}
  {classification_count: 2, date: "08/14/2014"}
  {classification_count: 8, date: "08/15/2014"}
  {classification_count: 4, date: "08/16/2014"}
  {classification_count: 9, date: "08/17/2014"}
  {classification_count: 5, date: "08/18/2014"}
  {classification_count: 2, date: "08/19/2014"}
  {classification_count: 8, date: "08/20/2014"}
  {classification_count: 0, date: "08/21/2014"}
  {classification_count: 9, date: "08/22/2014"}
  {classification_count: 3, date: "08/23/2014"}
  {classification_count: 2, date: "08/24/2014"}
  {classification_count: 15, date: "08/25/2014"}
  {classification_count: 15, date: "08/26/2014"}
  {classification_count: 12, date: "08/27/2014"}
  {classification_count: 20, date: "08/28/2014"}
  {classification_count: 3, date: "08/29/2014"}
  {classification_count: 5, date: "08/30/2014"}
  {classification_count: 5, date: "08/31/2014"}
  {classification_count: 7, date: "09/01/2014"}
  {classification_count: 16, date: "09/02/2014"}
  {classification_count: 18, date: "09/03/2014"}
  {classification_count: 25, date: "09/04/2014"}
  {classification_count: 18, date: "09/05/2014"}
  {classification_count: 13, date: "09/06/2014"}
  {classification_count: 13, date: "09/07/2014"}
  {classification_count: 14, date: "09/08/2014"}
  {classification_count: 17, date: "09/09/2014"}
  {classification_count: 19, date: "09/10/2014"}
  {classification_count: 5, date: "09/11/2014"}
]

PROJECT_CLASSIFICATION_COUNTS = PROJECT_CLASSIFICATION_DATA.map (p) -> p.classification_count

module?.exports = React.createClass
  displayName: 'Dashboard'

  componentDidMount: ->
    console.log "props", @props.project.name

  render: ->
    <div className="dashboard">
      <h1>Project Dashboard: {@props.project.name}</h1>
      <FillChart data={PROJECT_CLASSIFICATION_COUNTS} rowSize={7} gap={4} itemDiameter={40}/>
    </div>
