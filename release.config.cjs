const { getConfig } = require('@jeromefitz/semantic')
const isCI = require('is-ci')

!isCI && require('dotenv').config({ path: './.env' })

const { name } = require('./package.json')

const branches = [{ name: 'main' }, { name: 'develop', prerelease: 'develop' }]

const configPassed = {
  branches,
  contributorsProhibitList: {
    email: [],
    login: ['BotJerome', 'JeromeFitz'],
  },
  enableNpm: false,
  repositoryUrl: `https://github.com/${name.replace('@', '')}`,
  tagFormat: 'v${version}',
}

const config = getConfig(configPassed)

module.exports = config