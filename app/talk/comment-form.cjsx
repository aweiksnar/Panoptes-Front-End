# @cjsx React.DOM

React = require 'react'

module?.exports = React.createClass
  displayName: 'CommentForm'
  
  render: ->
    <form>
      <textarea className="talk comment" ref="commentContent"/>
      <button>Submit</button>
    </form>
    
