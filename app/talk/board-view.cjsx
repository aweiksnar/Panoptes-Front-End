# @cjsx React.DOM

React = require 'react'
Route = require '../lib/route'
Link = require '../lib/link'
PostListItem = require './post-list-item'
Paginate = require '../components/paginate'

FAKE_POSTS_DATA = [
  {
    title: "Check this out"
    author: "madamescience"
    post_count: "556"
    participants: "49"
  },
  {
    title: "Is this an Asteroid?"
    author: "sirpostsalot"
    post_count: "56"
    participants: "80"
  },
  {
    title: "I've never seen anything like this!"
    author: "ll cool poster"
    post_count: "346"
    participants: "2"
  },
  {
    title: "I need some help guys"
    author: "imposter"
    post_count: "6"
    participants: "41"
  },
  {
    title: "Is the universe really this color?"
    author: "spam user"
    post_count: "63"
    participants: "43"
  },
  {
    title: "I need some help guys"
    author: "imposter"
    post_count: "6"
    participants: "41"
  },
  {
    title: "I need some help guys"
    author: "imposter"
    post_count: "6"
    participants: "41"
  },
  {
    title: "I need some help guys"
    author: "imposter"
    post_count: "6"
    participants: "41"
  },
  {
    title: "I need some help guys"
    author: "imposter"
    post_count: "6"
    participants: "41"
  },
  {
    title: "I need some help guys"
    author: "imposter"
    post_count: "6"
    participants: "41"
  },
  {
    title: "I need some help guys"
    author: "imposter"
    post_count: "6"
    participants: "41"
  }
]

module?.exports = React.createClass
  displayName: 'BoardView'

  postListItem: (post) ->
    <PostListItem post={post} project={@props.project}/>

  handlePagination: (currentPage, dataRange) ->
    console.log "pagination data", currentPage, dataRange

  render: ->
    posts = FAKE_POSTS_DATA.map(@postListItem)

    <div className='board-view'>
      <Link href="/projects/#{@props.project.owner_name}/#{@props.project.name}/talk"><p><- link back to talk view</p></Link>
      <h1>Board View <input placeholder="Search" className="talk search" /></h1>
      {posts}
      <Paginate coll={posts} perPage={4} onPageChange={@handlePagination}/>
    </div>
