# @cjsx React.DOM

React = require 'react'
Link = require '../lib/link'
CommentView = require './comment-view'
CommentForm = require './comment-form'

FAKE_COMMENTS = [
  {
    author: "alvin"
    message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
  },
  {
    author: "theodore"
    message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text."
  },
  {
    author: "pig"
    message: "haha!!!!"
  },
  {
    author: "cow"
    message: "Lorem Ipsum is  galley of type and scrambled it to make a type specimen book."
  },
  {
    author: "moose"
    message: "I'm a moose'"
  }  
]

module?.exports = React.createClass
  displayName: 'PostView'

  comment: (data) ->
    <CommentView data={data} />

  render: ->
    comments = FAKE_COMMENTS.map(@comment)
    <div className='post-view'>
      <Link href="/projects/#{@props.project.owner_name}/#{@props.project.name}/talkboard"><p><- link back to board view</p></Link>
      <h1>Post View</h1>
      <img src="http://placehold.it/600X400&text=Subject%20Image"/>
      <h2>Title / Author</h2>
      <p>
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
      </p>
      <hr />
      <CommentForm />
      {comments}
    </div>
