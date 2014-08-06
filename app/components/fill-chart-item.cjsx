# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: 'FillChartItem'
  rows: 4

  fillColor: ->
    "rgba(0, #{@props.fill}, 0, 1)"

  diameter: ->
    @props.r * 2
  
  xPosition: ->
    @diameter() * @colOf(@rows) + @props.r

  yPosition: ->
    @diameter() * @rowOf(@rows)

  endOfRow: (n) ->
    @props.i + 1 >= n

  rowNum: (n) ->
    Math.floor(@props.i / n) + 1
    
  colOf: (n) ->
    @props.i % n

  rowOf: (n) ->
    if @endOfRow(n) then @rowNum(n) else 1

  render: ->
    <circle r={@props.r} cx={@xPosition()} cy={@yPosition()} fill={@fillColor()}></circle>
