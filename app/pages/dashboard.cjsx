# @cjsx React.DOM

React = require 'react'
FillChart = require '../partials/fill-chart'
BarGraph = require '../components/bar-graph'

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

BAR_GRAPH =
  data: [
    {label: "a", value: 3}
    {label: "b", value: 5}
    {label: "c", value: 8}
    {label: "d", value: 6}
    {label: "e", value: 9}
    {label: "f", value: 13}
    {label: "g", value: 4}
  ]
  labels:
    x: "x-axis-label"
    y: "y-axis-label"


module?.exports = React.createClass
  displayName: 'Dashboard'

  componentDidMount: ->
    console.log "props", @props.project.name

  render: ->
    <div className="dashboard">
      <h1>Project Dashboard: {@props.project.name}</h1>
      <BarGraph data={BAR_GRAPH.data} axisLabels={BAR_GRAPH.labels} height={300} width={500} gap={10} color="black"/>
      <FillChart data={PROJECT_CLASSIFICATION_DATA} rowSize={7} gap={4} itemDiameter={40}/>
    </div>
