# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: 'FillChartItem'
  rows: 7

  fillColor: ->
    "rgba(#{@props.color.r}, #{@props.color.g}, #{@props.color.b}, #{@fillOpacity()})"

  fillOpacity: ->
    @props.fill || 0.05

  diameter: ->
    @props.r * 2

  xSpacing: ->
    @colOf(@rows) * @props.gap

  xPosition: ->
    @diameter() * @colOf(@rows) + @props.r + @xSpacing()

  ySpacing: ->
    (@rowNum(@rows) - 1) * @props.gap

  yPosition: ->
    @diameter() * (@rowOf(@rows) - 1) + @ySpacing() + @props.r

  endOfRow: (n) ->
    @props.i + 1 >= n

  rowNum: (n) ->
    Math.floor(@props.i / n) + 1

  colOf: (n) ->
    @props.i % n

  rowOf: (n) ->
    if @endOfRow(n) then @rowNum(n) else 1

  render: ->
    <circle r={@props.r} cx={@xPosition()} cy={@yPosition()} fill={@fillColor()} onMouseOver={@props.onHover()}></circle>
