# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: 'CommentForm'

  submitTalkComment: (e) ->
    e.preventDefault()
    @refs.commentContent.getDOMNode().value = ""
    console.log "submit talk comment here"
  
  render: ->
    <form onSubmit={@submitTalkComment}>
      <textarea className="talk comment" ref="commentContent"/>
      <button>Submit</button>
    </form>
    

