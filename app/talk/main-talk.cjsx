# @cjsx React.DOM

React = require 'react'

PROJECTS = [
  {name: "Galaxy Moo", description: "Help find cows in the galaxy"}
  {name: "Tornado Hunters", description: "Help find Tornados in the midwest"}
  {name: "Art Critics", description: "Critique art"}
]

module?.exports = React.createClass
  displayName: 'MainTalk'

  projectItem: (project) ->
    <div className="main-talk-project-item">
      <h3>{project.name}</h3>
      <p>{project.description}</p>
    </div>

  render: ->
    <div className='main-talk'>
      <div className='main-talk-header'>
        <h1>Zooniverse Talk</h1>
      </div>

      <div className='content-container'>
        <div className='main-talk-project'>
          <h2>New Projects</h2>
          {PROJECTS.map(@projectItem)}
        </div>

        <div className='main-talk-project'>
          <h2>Trending Projects</h2>
          {PROJECTS.map(@projectItem)}
        </div>

        <div className='main-talk-project'>
          <h2>Popular Projects</h2>
          {PROJECTS.map(@projectItem)}
        </div>
      </div>
    </div>
    
