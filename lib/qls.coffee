fs = require 'fs'
path = require 'path'

showUsage = ->
  console.log '''
    Usage: % qls .
    Options: -f -> Show full path
  '''
  process.exit 1

module.exports = ->
  if !process.argv[2]? then showUsage()
  if process.argv[2].match /\-f/ then full = true
  if full
    target = process.argv[3]
  else
    target = process.argv[2]
  targetDir = path.resolve(process.cwd(), target)
  fs.readdir targetDir, (err, files)->
    if err?
      console.log err
    else
      files = if full
        files.map((file)-> "'#{targetDir}/#{file}'")
      else
        files.map((file)-> "'#{file}'")
      console.log files.reduce((sum, file)-> "#{sum}\n#{file}")
