# @cjsx React.DOM

React = require 'react'

module.exports = React.createClass
  displayName: 'RadioTask'

  render: ->
    answers = for answer, i in @props.answers
      <label className="answer" key={i}>
        <input type="radio" name="currentTaskAnswer" value={i} checked={answer is @props.answer} onChange={@handleChange} />
        <span className="clickable">{answer.label}</span>
      </label>

    <div className="radio-task">
      <div className="question">{@props.question}</div>
      <div className="answers">{answers}</div>
    </div>

  handleChange: (e) ->
    answerIndex = e.target.value
    @props.onChange @props.answers[answerIndex]
