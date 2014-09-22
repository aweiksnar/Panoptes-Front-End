# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass

  componentDidMount: ->
    console.log "@props", @props

  getInitialState: ->
    activePage: 1

  onClickNext: ->
    nextPage = if @state.activePage is @props.pageCount then @props.pageCount else @state.activePage + 1
    @setState activePage: nextPage

  onClickPrev: ->
    prevPage = if @state.activePage is 1 then @state.activePage else @state.activePage - 1
    @setState activePage: prevPage

  onPageNumClick: (e) ->
    pageNum = +e.target.innerHTML
    @setState activePage: pageNum

  pageNum: (i) ->
    <li onClick={@onPageNumClick} className={if i is @state.activePage then "active" else ""}>
      {i}
    </li>

  render: ->
    pageNums = [1..@props.pageCount].map(@pageNum)

    <ul className="paginate">
      <li onClick={@onClickPrev}>Prev</li>
      {pageNums}
      <li onClick={@onClickNext}>Next</li>
    </ul>
