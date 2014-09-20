fs = require 'fs'
path = require 'path'

module.exports = -> fs.readdir path.resolve(process.cwd(), process.argv[2]), (err, files)->
  if err?
    console.log err
  else
    console.log files.map((file)-> "'#{file}'").reduce((sum, file)-> "#{sum}\n#{file}")
