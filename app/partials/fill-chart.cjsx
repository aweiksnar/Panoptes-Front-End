# @cjsx React.DOM

React = require 'react'
FillChartItem = require './fill-chart-item'
FillChartDataBox = require './fill-chart-data-box'

module?.exports = React.createClass
  displayName: 'FillChart'

  componentWillMount: ->
    @setState activeItem: 0

  dataMax: ->
    Math.max @classifyCounts()...

  dataMin: ->
    Math.min @classifyCounts()...

  scaledDataItem: (item) ->
    (item - @dataMin()) / (@dataMax() - @dataMin())

  classifyCounts: ->
    @props.data.map (d) -> d.classification_count

  rowWidth: ->
    (@props.rowSize * @props.itemDiameter) + ((@props.rowSize - 1) * @props.gap)

  numberOfRows: ->
    Math.ceil (@classifyCounts().length / @props.rowSize)

  colHeight: ->
    (@numberOfRows() * @props.itemDiameter) + (@props.gap * (@numberOfRows() - 1))

  radius: -> @props.itemDiameter / 2

  itemIndex: (child) ->
    i = 0
    i++ while child = child.previousSibling
    i

  activeItemData: ->
    @props.data[@state.activeItem]

  onFillChartItemHover: (e) ->
    @setState activeItem: @itemIndex(e.target)
    console.log @activeItemData()

  render: ->
    fillChartItems = for item, i in @classifyCounts()
      new FillChartItem
        i: i,
        r: @radius(),
        fill: @scaledDataItem(item)
        gap: 4
        activeItem: @state.activeItem
        rowSize: @props.rowSize
        color:
          r: 0
          g: 0
          b: 0
        onHover: => @onFillChartItemHover


    <div>
     <h2>Fill chart</h2>
     <svg width={@rowWidth()} height={@colHeight()}>
       {fillChartItems}
     </svg>
     <FillChartDataBox activeItem={@activeItemData()}/>
    </div>

