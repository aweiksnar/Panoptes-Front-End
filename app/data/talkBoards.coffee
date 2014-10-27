Store = require './store'
{dispatch} = require '../lib/dispatcher'

GENERAL_BOARD =
  name: 'General'
  posts: [
    {id: 1, name: "General Post"}
    {id: 2, name: "Another General Post"}
    {id: 3, name: "MORE......."}
    ]

SCIENCE_BOARD =
  name: 'Science'
  posts: [
    {id: 4, name: "Science Post"}
    {id: 6, name: "Another Science Post"}
    {id: 9, name: "MORE......."}
  ]

HELP_BOARD = 
  name: 'Help'
  posts: [
    {id: 10, name: "HALP!!"}
    {id: 11, name: "Another Help Post"}
    {id: 12, name: "MORE......."}
    ]


module.exports = window.talkBoardsStore = new Store
  root: '/talk'
  examples: [GENERAL_BOARD, SCIENCE_BOARD, HELP_BOARD]
