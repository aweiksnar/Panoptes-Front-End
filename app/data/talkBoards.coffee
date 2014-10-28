Store = require './store'
{dispatch} = require '../lib/dispatcher'

DEV_COMMENTS = [
  {user: "User1", content: "Hello", date: "8/13/1392"}
  {user: "User1", content: "Yo", date: "8/13/1392"}
  {user: "User1", content: "This thing work?", date: "8/13/1392"}
  {user: "User1", content: "Yep", date: "8/13/1392"}
  {user: "User1", content: "Cool", date: "8/13/1392"}
]

GENERAL_BOARD =
  name: 'General'
  description: "General discussion topics"
  posts: [
    {
      id: 1,
      name: "General Post"
      user: "Sir. Postsalot"
      location: "http://placehold.it/400X200"
      comments: DEV_COMMENTS
    }
    {
      id: 2
      name: "Another General Post"
      user: "Dr. Poster"
      location: "http://placehold.it/400X200"
      comments: DEV_COMMENTS
    }
    {
      id: 3
      name: "MORE......."
      user: "PostingLikeMad"
      location: "http://placehold.it/400X200"
      comments: DEV_COMMENTS
    }
  ]

SCIENCE_BOARD =
  name: 'Science'
  description: "Talk about the science behind the projects"
  posts: [
    {
      id: 4,
      name: "Science Post"
      user: "CelebrityUser"
      location: "http://placehold.it/400X200"
      comments: DEV_COMMENTS
    }
    {
      id: 6,
      name: "Another Science Post"
      user: "KelpMaster 2000"
      location: "http://placehold.it/400X200"
      comments: DEV_COMMENTS
    }
    {
      id: 9,
      name: "MORE......."
      user: "Zoonihacker"
      location: "http://placehold.it/400X200"
      comments: DEV_COMMENTS
    }
  ]

HELP_BOARD =
  name: 'Help'
  description: "Need help? Post here..."
  posts: [
    {
      id: 10
      name: "HALP!!"
      user: "HELP_ME_NOW"
      location: "http://placehold.it/400X200"
      comments: DEV_COMMENTS
    }
    {
      id: 11
      name: "Another Help Post"
      user: "Clueless."
      location: "http://placehold.it/400X200"
      comments: DEV_COMMENTS
    }
    {
      id: 12
      name: "MORE......."
      user: "EmoticonUser124"
      location: "http://placehold.it/400X200"
      comments: DEV_COMMENTS
    }
  ]


module.exports = window.talkBoardsStore = new Store
  root: '/talk'
  examples: [GENERAL_BOARD, SCIENCE_BOARD, HELP_BOARD]
