# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: 'Paginate'

  propTypes:
    onPageChange: React.PropTypes.func # Triggered on page changes and passes {page: number, range: array}
    perPage: React.PropTypes.number    # Number of items to display per page
    coll: React.PropTypes.array        # Collection of data (TODO: change this to length?)

  getInitialState: ->
    activePage: 1

  displayItems: (n) ->
    # range of items to display as indexes
    firstItem = (n - 1) * @props.perPage
    lastItem = Math.min (firstItem + @props.perPage), @props.coll.length
    [firstItem...lastItem]

  pageCount: ->
    Math.floor(@props.coll.length / @props.perPage) + 1

  nextPage: ->
    pageCount = @pageCount()
    nextPage = if @state.activePage is pageCount then pageCount else @state.activePage + 1
    @setState activePage: nextPage
    nextPage

  prevPage: ->
    prevPage = if @state.activePage is 1 then @state.activePage else @state.activePage - 1
    @setState activePage: prevPage
    prevPage

  onPageClick: (pageClicked) ->
    page = switch pageClicked
      when 'next' then @nextPage()
      when 'prev' then @prevPage()
      else
        @setState activePage: +pageClicked
        +pageClicked

    @props.onPageChange({page: page, range: @displayItems(page)})

    return

  pageNum: (i) ->
    <li onClick={=> @onPageClick(i)} className={if i is @state.activePage then "active" else ""}>
      {i}
    </li>

  render: ->
    pageNums = [1..@pageCount()].map(@pageNum)

    <ul className="paginate">
      <li onClick={=> @onPageClick('prev')}>Prev</li>
      {pageNums}
      <li onClick={=> @onPageClick('next')}>Next</li>
    </ul>
