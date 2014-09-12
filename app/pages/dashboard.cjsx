# @cjsx React.DOM

React = require 'react'
FillChart = require '../partials/fill-chart'
BarGraph = require '../components/bar-graph'
LineGraph = require '../components/line-graph'
StatsBox = require '../partials/stats-box'

PROJECT_CLASSIFICATIONS =
  y:
    key: 'classification_count'
    label: 'Classifications'
  x:
    key: 'date'
    label: 'Date'

  data: [
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

PROJECT_CLASSIFICATION_COUNTS = PROJECT_CLASSIFICATIONS.data.map (p) -> p.classification_count

BAR_GRAPH =
  x:
    key: 'label'
    label: 'Number'
  y:
    key: 'value'
    label: 'Users'

  data: [
    {label: "xAxisMin", value: 3}
    {label: "second", value: 5}
    {label: "third", value: 8}
    {label: "midpoint!", value: 3}
    {label: "fifth", value: 9}
    {label: "sixth", value: 13}
    {label: "xAxisMax", value: 4}
  ]

PROJECT_STATS_DATA =
  total_classifications: "26,127"
  total_users: "3,145"
  total_subjects: "92,301"
  percent_complete: "27%"

USER_STATS_DATA =
  total_classifications: "1,231"
  average_daily_classifications: "15"
  classifications_today: "5"
  total_talk_comments: "71"
  talk_comments_today: "3"

module?.exports = React.createClass
  displayName: 'Dashboard'

  componentDidMount: ->
    console.log "props", @props.project.name

  render: ->
    <div className="dashboard">
      <h1>Project Dashboard: {@props.project.name}</h1>

      <StatsBox data={PROJECT_STATS_DATA} title={"#{@props.project.name} Statistics"}/>
      <StatsBox data={USER_STATS_DATA} title={"User Statistics"} />

      <h2>Line Graph</h2>
      <LineGraph data={PROJECT_CLASSIFICATIONS.data} x={PROJECT_CLASSIFICATIONS.x} y={PROJECT_CLASSIFICATIONS.y}} pointRadius={10} height={300} yLines={5}/>

      <h2>Bar Graph</h2>
      <BarGraph data={BAR_GRAPH.data} x={BAR_GRAPH.x} y={BAR_GRAPH.y} axisLabels={BAR_GRAPH.labels} height={300} gap={3} color="black"/>

      <LineGraph data={BAR_GRAPH.data} x={BAR_GRAPH.x} y={BAR_GRAPH.y}} pointRadius={10} height={300} yLines={5}/>

      <BarGraph data={PROJECT_CLASSIFICATIONS.data} x={PROJECT_CLASSIFICATIONS.x} y={PROJECT_CLASSIFICATIONS.y}} height={300} gap={1} color="black"/>
  
      <FillChart data={PROJECT_CLASSIFICATIONS.data} rowSize={7} gap={4} itemDiameter={40}/>
    </div>
